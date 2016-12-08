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
#include <avr/sleep.h>

#include <stdint.h>

#include "bitop.h"
#include "io.h"

extern "C" {
#include "TWI_master.h"
}

using namespace avr_cpp_lib;

static uint8_t EEMEM mode_eeprom;

static OutputPin supply(&DDRA, &PORTA, PA3);
static OutputPin luna0(&DDRB, &PORTB, PB0);
static OutputPin luna1(&DDRA, &PORTA, PA7);
static OutputPin luna2(&DDRA, &PORTA, PA0);
static OutputPin luna3(&DDRB, &PORTB, PB1);
static OutputPin luna4(&DDRB, &PORTB, PB2);

static void set_moon(uint8_t mode) {
	if (mode == 1) {
		supply.set();
		luna0.set();
		luna1.clear();
		luna2.clear();
		luna3.clear();
		luna4.clear();
	} else if (mode == 2) {
		supply.set();
		luna0.set();
		luna1.set();
		luna2.clear();
		luna3.clear();
		luna4.clear();
	} else if (mode == 3) {
		supply.set();
		luna0.set();
		luna1.set();
		luna2.set();
		luna3.clear();
		luna4.clear();
	} else if (mode == 4) {
		supply.set();
		luna0.set();
		luna1.set();
		luna2.set();
		luna3.set();
		luna4.clear();
	} else if (mode == 5) {
		supply.set();
		luna0.set();
		luna1.set();
		luna2.set();
		luna3.set();
		luna4.set();
	} else if (mode == 6) {
		supply.set();
		luna0.clear();
		luna1.set();
		luna2.set();
		luna3.set();
		luna4.set();
	} else if (mode == 7) {
		supply.set();
		luna0.clear();
		luna1.clear();
		luna2.set();
		luna3.set();
		luna4.set();
	} else if (mode == 8) {
		supply.set();
		luna0.clear();
		luna1.clear();
		luna2.clear();
		luna3.set();
		luna4.set();
	} else if (mode == 9) {
		supply.set();
		luna0.clear();
		luna1.clear();
		luna2.clear();
		luna3.clear();
		luna4.set();
	} else {
		supply.clear();
		luna0.clear();
		luna1.clear();
		luna2.clear();
		luna3.clear();
		luna4.clear();
	}
}

static uint8_t calculate_moon() {
	uint8_t address = 4;
	uint8_t data[3];
	if (!write_data(&address, 1)) {
		return 0;
	} else if (!read_bytes(data, 3)) {
		return 0;
	}

	uint32_t n = 0;
	const uint32_t DAY = 24 * 60;
	const uint32_t MOD = 42524;

	uint8_t years = 100 + 10*((data[2] >> 4) & 0xf) + (data[2] & 0xf);
	n += uint32_t(years) * 365 * DAY;
	n += uint32_t(((years - 1) / 4) + 1) * DAY;
	n -= uint32_t(((years - 1) / 100) + 1) * DAY;
	n += uint32_t(((years - 100 - 1) / 400) + 1) * DAY;


	const uint8_t month = 10*((data[1] >> 4) & 0x1) + (data[1] & 0xf);
	for (uint8_t calculation_month = 1; calculation_month < month; calculation_month++) {
		if ((calculation_month < 8 && calculation_month % 2 == 1) || (calculation_month >= 8 && calculation_month % 2 == 0)) {
			n += 31 * DAY;
		} else if (calculation_month == 2) {
			if (years % 4 == 0 && years % 100 != 0) {
				n += 29 * DAY;
			} else {
				n += 28 * DAY;
			}
		} else {
			n += 30 * DAY;
		}
	}

	n += uint32_t(((data[0] >> 4) & 0b011) * 10 + (data[0] & 0xf) - 1) * DAY;

	return (((n % MOD + DAY/2)/DAY + 1) / 3) % 10;
}

static void moon_timer() {
	uint8_t mode = eeprom_read_byte(&mode_eeprom);
	static uint8_t i = 0;
	if (mode == 0xf) {
		set_moon(i);
		i++;
		if (i >= 10) {
			i = 0;
		}
	} else if (mode == 0xe) {
		set_moon(calculate_moon());
	} else {
		set_moon(0);
	}
}

static void set_mode() {
	uint8_t mode = eeprom_read_byte(&mode_eeprom);
	if (mode <= 9) {
		// disable moon update timer
		TCCR1B = 0;
		set_moon(mode);
	} else {
		// enable moon update timer (10s)
		TCNT1 = 0;
		TCCR1B = BIT(CS12) | BIT(CS10);
		moon_timer();
	}
}

static void time_data_to_uart() {
	uint8_t address = 0;
	uint8_t data[8];
	data[0] = 0;
	if (write_data(&address, 1)) {
		if (read_bytes(&data[1], 7)) {
			data[0] = 1;
		}
	}

	SETBIT(UCSR0B, TXEN0);
	for (uint8_t i = 0; i < sizeof(data)/sizeof(data[0]); i++) {
		while (BITCLEAR(UCSR0A, UDRE0));
		UDR0 = data[i];
	}
	CLEARBIT(UCSR0B, TXEN0);
}

int main() {
	// init

	// enable UART
	// enable receive and receive interrupt
	UCSR0B = BIT(RXEN0) | BIT(RXCIE0);
	// 8 bits
	UCSR0C = BIT(UCSZ01) | BIT(UCSZ00);
	// 19200 baud rate
	UBRR0 = 25;

	// set timer overflow interrupt
	TIMSK1 = BIT(TOIE1);

	twi_init();

	set_mode();

	// enable interrupts
	sei();

	for (;;) {
		sleep_mode();
	}
}

ISR(TIMER1_OVF_vect) {
	moon_timer();
}

static const uint8_t UART_ADDRESS = 0xe;
ISR(USART0_RX_vect) {
	static uint8_t ignore = 0;
	static uint8_t state = 0;
	static uint8_t buffer[8];

	uint8_t data = UDR0;

	if (ignore > 0) {
		ignore--;
		return;
	}

	if (state == 0) {
		if (UART_ADDRESS == (data & 0x0f)) {
			state = 1;
		} else {
			ignore = data >> 4;
		}
	} else if (state == 1) {
		uint8_t command = data & 0xf;
		if (command == 0) {
			uint8_t mode = data >> 4;
			eeprom_update_byte(&mode_eeprom, mode);
			set_mode();
			state = 0;
		} else if (command == 1) {
			time_data_to_uart();
			state = 0;
		} else if (command == 2) {
			state = 2;
		} else if (command == 3) {
			state = 9;
		} else {
			state = 0;
		}
	} else if (state >= 2 && state < 8) {
		buffer[state-1] = data;
		state++;
	} else if (state == 8) {
		buffer[7] = data;
		buffer[0] = 0;
		uint8_t status = write_data(buffer, 8);
		SETBIT(UCSR0B, TXEN0);
		UDR0 = status;
		CLEARBIT(UCSR0B, TXEN0);
		set_mode();
		state = 0;
	} else if (state == 9) {
		buffer[0] = 7;
		buffer[1] = data;
		uint8_t status = write_data(buffer, 2);
		SETBIT(UCSR0B, TXEN0);
		UDR0 = status;
		CLEARBIT(UCSR0B, TXEN0);
		state = 0;
	} else {
		state = 0;
	}
}
