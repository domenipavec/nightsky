#!/usr/bin/env python

import code
import serial
import time

ser = None
for i in range(3):
    try:
        ser = serial.Serial('/dev/ttyUSB{n}'.format(n=i), 19200)
    except serial.serialutil.SerialException:
        pass

print("Connected to: " + ser.name)


def packet(address, data=b''):
    if len(data) > 0xf:
        raise Exception('Too much data for this packet')
    send = chr((address & 0xf) | (len(data) << 4)) + data
    print("Sending: " + str([ord(x) for x in send]))
    ser.write(send)


def zvezde_command(id, command, data=b''):
    if id >= 32:
        raise Exception('Only 32 leds here')
    packet(0xf, chr((command << 5) | id) + data)


def zvezde_set(id, brightness):
    zvezde_command(id, 2, chr(brightness))


def zvezde_id(id):
    zvezde_command(id, 3)


def zvezde_all():
    data = {
        0: 7,
        1: 255,
        2: 255,
        3: 15,
        4: 127,
        5: 15,
        6: 31,
        7: 63,
        8: 15,
        9: 3,
        10: 127,
        11: 31,
        12: 7,
        13: 15,
        14: 63,
        15: 3,
        16: 7,
        17: 63,
        18: 63,
        19: 3,
        20: 7,
        21: 15,
        22: 127,
        23: 1,
        24: 31,
        25: 63,
        26: 127,
        27: 15,
        28: 7,
        29: 15,
        30: 31,
        31: 7,
    }
    for id, value in data.items():
        zvezde_set(id, value)
        time.sleep(0.1)


def utrinek_start_left(address):
    packet(address, chr(0))


def utrinek_start_right(address):
    packet(address, chr(1))


def utrinek_set_mode(address, mode):
    packet(address, chr(2) + chr(mode))


def utrinek_set_random_min(address, min):
    packet(address, chr(3) + chr(min >> 8) + chr(min & 0xff))


def utrinek_set_random_max(address, max):
    packet(address, chr(4) + chr(max >> 8) + chr(max & 0xff))


def utrinek_set_address(address, new_address):
    packet(address, chr(5) + chr(new_address))


def luna_set_mode(mode):
    packet(0xe, chr(mode << 4))


def luna_set_auto():
    luna_set_mode(0xe)


def luna_set_changing():
    luna_set_mode(0xf)


def luna_get_time():
    ser.reset_input_buffer()
    packet(0xe, chr(1))
    data = [ord(x) for x in ser.read(8)]
    if (data[0] == 1):
        print('Success')
        if data[4] & 0b00100000:
            print('Oscillator running')
        else:
            print('Oscillator not running')
    else:
        print('Fail')
    print("20{}{}-{}{}-{}{} {}{}:{}{}:{}{}".format(
        data[7] >> 4,
        data[7] & 0xf,
        (data[6] >> 4) & 1,
        data[6] & 0xf,
        data[5] >> 4,
        data[5] & 0xf,
        data[3] >> 4,
        data[3] & 0xf,
        data[2] >> 4,
        data[2] & 0xf,
        (data[1] >> 4) & 0b0111,
        data[1] & 0xf
    ))
    print(data)


def luna_oscillator_out():
    ser.reset_input_buffer()
    packet(0xe, chr(3) + chr(0b11000011))
    print(ord(ser.read()))


def luna_disable_out():
    ser.reset_input_buffer()
    packet(0xe, chr(3) + chr(0b10000000))
    print(ord(ser.read()))


def luna_set_time(year, month, day, hours, minutes, seconds):
    sec_byte = chr(0b10000000 | ((seconds / 10) << 4) | (seconds % 10))
    min_byte = chr(((minutes / 10) << 4) | (minutes % 10))
    hour_byte = chr(((hours / 10) << 4) | (hours % 10))
    day_byte = chr(0b00001000)
    date_byte = chr(((day / 10) << 4) | (day % 10))
    month_byte = chr(((month / 10) << 4) | (month % 10))
    year_byte = chr((((year / 10) % 10) << 4) | (year % 10))

    ser.reset_input_buffer()
    packet(0xe, chr(2) + sec_byte + min_byte + hour_byte + day_byte + date_byte + month_byte + year_byte)
    print(ord(ser.read()))

code.interact(local=locals())
