/* File: main.cpp
 * Contains base main function and usually all the other stuff that avr does...
 */
/* Copyright (c) 2012-2013 Domen Ipavec (domen.ipavec@z-v.si)
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

//#include <util/delay.h>

#include <avr/io.h>
#include <avr/interrupt.h>
//#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <util/delay.h>

#include <stdint.h>

#include "bitop.h"
#include "io.h"
#include "exponential.h"

using namespace avr_cpp_lib;

// STATES
static const uint8_t S_STARS_INIT = 0;
static const uint8_t S_STARS_START = 1;
static const uint8_t S_STARS = 2;
static const uint8_t S_STARS_END = 3;
static const uint8_t S_TEST_ONE = 8;
static const uint8_t S_CLOUDS_INIT = 10;
static const uint8_t S_CLOUDS_START = 11;
static const uint8_t S_CLOUDS = 12;
static const uint8_t S_CLOUDS_END = 13;

static volatile uint8_t state = S_CLOUDS_INIT;

static inline void led_test(OutputPin latch, OutputPin clock, OutputPin data, uint8_t n) {
	data.set();
	for (; n > 0; n--) {
		clock.set();
		clock.clear();

		latch.set();
		latch.clear();

		data.clear();
		for (uint16_t j = 0; j < 500; j++) {
			_delay_ms(1);
		}
	}
}

static inline void led_clear(OutputPin latch, OutputPin clock, OutputPin data, uint8_t n) {
	data.clear();
	for (; n > 0; n--) {
		clock.set();
		clock.clear();

		latch.set();
		latch.clear();
	}
}

static const uint8_t spi_data_len = 4;
static const uint8_t spi_buffer_len = 8;
static volatile uint8_t spi_data[spi_buffer_len][spi_data_len] = {0};

static const uint8_t brightness_len = 32;
static uint8_t EEMEM brightness_eeprom[brightness_len];

static void update_spi_from_brightness() {
	for (uint8_t brightness_index = 0; brightness_index < brightness_len; brightness_index++) {
		uint8_t brightness = eeprom_read_byte(&brightness_eeprom[brightness_index]);
		for (uint8_t bit = 0; bit < 8; bit++) {
			if (BITSET(brightness, bit)) {
				SETBIT(spi_data[bit][brightness_index >> 3], brightness_index & 7);
			} else {
				CLEARBIT(spi_data[bit][brightness_index >> 3], brightness_index & 7);
			}
		}
	}
}

static inline bool delay_ms(uint16_t ms) {
	bool done = (TCNT1 >> 3) >= ms;
	if (done) {
		TCNT1 = 0;
	}
	return done;
}

static inline void set_pwm(const uint8_t v) {
	OCR2BL = exponential(v);
}

static inline void process_spi(uint8_t &spi_state, uint8_t &spi_data_index, uint8_t &spi_buffer_index) {
	if (spi_state == 0) {
		SPDR = spi_data[spi_buffer_index][spi_data_index];
		spi_data_index++;
		spi_state = 1;
	} else if (spi_state == 1) {
		if (BITSET(SPSR, SPIF)) {
			SPDR = spi_data[spi_buffer_index][spi_data_index];
			spi_data_index++;
			if (spi_data_index >= spi_data_len) {
				spi_data_index = 0;
				SETBIT(PORTB, PB0);
				CLEARBIT(PORTB, PB0);
				spi_state = 3;
			}
		}
	} else if (spi_state == 3) {
		if (TCNT0 >= BIT(spi_buffer_index)) {
			spi_buffer_index++;
			if (spi_buffer_index >= spi_buffer_len) {
				spi_buffer_index = 0;
			}
			spi_state = 0;
		}
	}
}

static const uint8_t UART_ADDRESS = 0xf;
ISR(USART0_RX_vect) {
	static uint8_t ignore = 0;
	static uint8_t uart_state = 0;
	static uint8_t led_index = 0;

	uint8_t data = UDR0;

	if (ignore > 0) {
		ignore--;
		return;
	}

	if (uart_state == 0) {
		if (UART_ADDRESS == (data & 0x0f)) {
			uart_state = 1;
		} else if (0x0c == (data & 0x0f)) {
			if (state == S_CLOUDS) {

				// reset delay
				TCNT1 = 0;

				state = S_CLOUDS_END;
			}
		} else if (0x0b == (data & 0x0f)) {
			if (state == S_STARS) {

				// reset delay
				TCNT1 = 0;

				state = S_STARS_END;
			}
		} else {
			ignore = data >> 4;
		}
	} else if (uart_state == 1) {
		led_index = data & (32-1);
		uart_state = data >> 5;
		if (uart_state == 3) {
			// activate only id
			for (uint8_t bit = 0; bit < 8; bit++) {
				for (uint8_t brightness_index = 0; brightness_index < brightness_len; brightness_index++) {
					if (brightness_index == led_index) {
						SETBIT(spi_data[bit][brightness_index >> 3], brightness_index & 7);
					} else {
						CLEARBIT(spi_data[bit][brightness_index >> 3], brightness_index & 7);
					}
				}
			}

			// reset delay
			TCNT1 = 0;

			state = S_TEST_ONE;

			uart_state = 0;
		}
	} else if (uart_state == 2) {
		eeprom_update_byte(&brightness_eeprom[led_index], data);
		update_spi_from_brightness();
		uart_state = 0;
	} else {
		uart_state = 0;
	}
}

int main() {
	// init
	OutputPin enable(&DDRA, &PORTA, PA7);
	OutputPin clock(&DDRA, &PORTA, PA4);
	OutputPin data(&DDRA, &PORTA, PA6);
	OutputPin latch(&DDRB, &PORTB, PB0);

	led_clear(latch, clock, data, 32);

	enable.clear();

	// led_test(latch, clock, data, 32);

	update_spi_from_brightness();

	// init spi
	// enable spi, enable master
	SPCR = BIT(SPE) | BIT(MSTR);
	// double spi speed
	SETBIT(SPSR, SPI2X);

	// enable UART
	// enable receive and receive interrupt
	UCSR0B = BIT(RXEN0) | BIT(RXCIE0);
	// 8 bits
	UCSR0C = BIT(UCSZ01) | BIT(UCSZ00);
	// 19200 baud rate
	UBRR0 = 25;

	// inti timer 1 for delay_ms function
	TCNT1 = 0;
	TCCR1B = BIT(CS12) | BIT(CS10);

	// enable timer 2 for hardware pwm of enable pin or clouds
	TOCPMCOE = BIT(TOCC0OE) | BIT(TOCC6OE);
	// fast pwm with set at bottom and clear on compare match, clk/64
	TCCR2A = BIT(COM2B1) | BIT(WGM20);
	TCCR2B = BIT(WGM22) | BIT(CS21) | BIT(CS20);

	// enable timer 0 for spi pwm at 31.25khz
	TCCR0B = BIT(CS02);

	// clouds output enable
	SETBIT(DDRA, PA1);

	// enable interrupts
	sei();

	uint8_t spi_state = 0;
	uint8_t spi_data_index = 0;
	uint8_t spi_buffer_index = 0;
	uint8_t pwm = 0;

	for (;;) {
		if (state == S_STARS_INIT) {
			if (delay_ms(200)) {
				TOCPMSA0 = 0; // disable clouds pwm
				CLEARBIT(PORTA, PA1);

				update_spi_from_brightness();

				pwm = 255;
				set_pwm(pwm);
				TCNT2 = 254;
				TOCPMSA1 = BIT(TOCC6S1); // enable stars pwm

				// reset delay
				TCNT1 = 0;

				spi_buffer_index = 0;
				spi_data_index = 0;
				spi_state = 0;
				state = S_STARS_START;
			}
		} else if (state == S_STARS_START) {
			process_spi(spi_state, spi_data_index, spi_buffer_index);
			if (delay_ms(10)) {
				pwm--;
				set_pwm(pwm);
				if (pwm <= 0) {
					state = S_STARS;
				}
			}
		} else if (state == S_STARS) {
			process_spi(spi_state, spi_data_index, spi_buffer_index);
		} else if (state == S_STARS_END) {
			process_spi(spi_state, spi_data_index, spi_buffer_index);
			if (delay_ms(10)) {
				pwm++;
				set_pwm(pwm);
				if (pwm >= 255) {
					state = S_CLOUDS_INIT;
				}
			}
		} else if (state == S_TEST_ONE) {
			process_spi(spi_state, spi_data_index, spi_buffer_index);
			if (delay_ms(1000)) {
				state = S_STARS_INIT;
			}
		} else if (state == S_CLOUDS_INIT) {
			if (delay_ms(200)) {
				TOCPMSA1 = 0; // disable stars pwm;
				enable.set();

				pwm = 0;
				set_pwm(pwm);
				TCNT2 = 255;
				TOCPMSA0 = BIT(TOCC0S1); // enable clouds pwm

				// reset delay
				TCNT1 = 0;

				state = S_CLOUDS_START;
			}
		} else if (state == S_CLOUDS_START) {
			if (delay_ms(10)) {
				pwm++;
				set_pwm(pwm);
				if (pwm >= 255) {
					state = S_CLOUDS;
				}
			}
		} else if (state == S_CLOUDS) {

		} else if (state == S_CLOUDS_END) {
			if (pwm >= 255) {
				if (delay_ms(8000)) {
					pwm--;
					set_pwm(pwm);
				}
			} else if (delay_ms(10)) {
				pwm--;
				set_pwm(pwm);
				if (pwm <= 0) {
					state = S_STARS_INIT;
				}
			}
		} else {
			state = S_STARS_INIT;
		}
	}
}



