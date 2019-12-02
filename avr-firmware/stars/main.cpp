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

using namespace avr_cpp_lib;


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
static const uint8_t brightness_data[brightness_len] = {
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
	255,
};

static void update_spi_from_brightness() {
	for (uint8_t brightness_index = 0; brightness_index < brightness_len; brightness_index++) {
		uint8_t brightness = brightness_data[brightness_index];
		for (uint8_t bit = 0; bit < 8; bit++) {
			if (BITSET(brightness, bit)) {
				SETBIT(spi_data[bit][brightness_index >> 3], brightness_index & 7);
			} else {
				CLEARBIT(spi_data[bit][brightness_index >> 3], brightness_index & 7);
			}
		}
	}
}

// static const uint8_t UART_ADDRESS = 0xf;
// ISR(USART0_RX_vect) {
//     static uint8_t ignore = 0;
//     static uint8_t state = 0;
//     static uint8_t led_index = 0;
//
//     uint8_t data = UDR0;
//
//     if (ignore > 0) {
//         ignore--;
//         return;
//     }
//
//     if (state == 0) {
//         if (UART_ADDRESS == (data & 0x0f)) {
//             state = 1;
//         } else {
//             ignore = data >> 4;
//         }
//     } else if (state == 1) {
//         led_index = data & (32-1);
//         state = data >> 5;
//         if (state == 3) {
//             // activate only id
//             for (uint8_t bit = 0; bit < 8; bit++) {
//                 for (uint8_t brightness_index = 0; brightness_index < brightness_len; brightness_index++) {
//                     if (brightness_index == led_index) {
//                         SETBIT(spi_data[bit][brightness_index >> 3], brightness_index & 7);
//                     } else {
//                         CLEARBIT(spi_data[bit][brightness_index >> 3], brightness_index & 7);
//                     }
//                 }
//             }
//
//             // disable id in 1 second
//             TCNT1 = 57722;
//
//             state = 0;
//         }
//     } else if (state == 2) {
//         eeprom_update_byte(&brightness_eeprom[led_index], data);
//         update_spi_from_brightness();
//         state = 0;
//     } else {
//         state = 0;
//     }
// }

ISR(TIMER1_COMPB_vect) {
	update_spi_from_brightness();
}

int main() {
	// init
	OutputPin enable(&DDRA, &PORTA, PA7);
	OutputPin clock(&DDRA, &PORTA, PA4);
	OutputPin data(&DDRA, &PORTA, PA6);
	OutputPin latch(&DDRB, &PORTB, PB0);

	led_clear(latch, clock, data, 32);

	enable.clear();

	led_test(latch, clock, data, 32);

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

	// enable timer for one shot id turn off
	// top
	OCR1A = 1000;
	// interrupt value
	OCR1B = 65534;
	// counter to 0
	TCNT1 = 0;
	// interrupt enable
	TIMSK1 = BIT(OCIE1B);
	// ctc, 7812Hz
	TCCR1B = BIT(WGM12) | BIT(CS12) | BIT(CS10);

	// enable interrupts
	sei();

	// enable timer for pwm at 31.25khz
	TCCR0B = BIT(CS02);

	for (;;) {
		for (uint8_t spi_buffer_index = 0; spi_buffer_index < spi_buffer_len; spi_buffer_index++) {
			for (uint8_t i = 0; i < spi_data_len; i++) {
				SPDR = spi_data[spi_buffer_index][i];
				while (BITCLEAR(SPSR, SPIF));
			}

			SETBIT(PORTB, PB0);
			CLEARBIT(PORTB, PB0);

			while (TCNT0 < BIT(spi_buffer_index));
			TCNT0 = 0;
		}
	}
}



