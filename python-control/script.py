#!/usr/bin/env python

import code
import serial
import time

ser = None
for i in range(3):
    try:
        ser = serial.Serial("/dev/ttyUSB{n}".format(n=i), 19200)
    except serial.serialutil.SerialException:
        pass

print("Connected to: " + ser.name)


def to_data(number):
    return bytes((number,))


def packet(address, data=b""):
    if len(data) > 0xF:
        raise Exception("Too much data for this packet")
    send = to_data((address & 0xF) | (len(data) << 4)) + data
    print("Sending: " + str([hex(x) for x in send]))
    ser.write(send)


def zvezde_command(id, command, data=b""):
    if id >= 32:
        raise Exception("Only 32 leds here")
    packet(0xF, to_data((command << 5) | id) + data)


def zvezde_set(id, brightness):
    zvezde_command(id, 2, to_data(brightness))


def zvezde_id(id):
    zvezde_command(id, 3)


def zvezde_all():
    data = {
        # zupnik
        #  0: 7,
        #  1: 255,
        #  2: 255,
        #  3: 15,
        #  4: 127,
        #  5: 15,
        #  6: 31,
        #  7: 63,
        #  8: 15,
        #  9: 3,
        #  10: 127,
        #  11: 31,
        #  12: 7,
        #  13: 15,
        #  14: 63,
        #  15: 3,
        #  16: 7,
        #  17: 63,
        #  18: 63,
        #  19: 3,
        #  20: 7,
        #  21: 15,
        #  22: 127,
        #  23: 1,
        #  24: 31,
        #  25: 63,
        #  26: 127,
        #  27: 15,
        #  28: 7,
        #  29: 15,
        #  30: 31,
        #  31: 7,
        # david
        0: 7,
        1: 7,
        2: 15,
        3: 7,
        4: 255,
        5: 15,
        6: 7,
        7: 63,
        8: 7,
        9: 127,
        10: 255,
        11: 15,
        12: 127,
        13: 15,
        14: 31,
        15: 15,
        16: 31,
        17: 127,
        18: 255,
        19: 255,
        20: 15,
        21: 15,
        22: 7,
        23: 127,
        24: 255,
        25: 7,
        26: 15,
        27: 127,
        28: 15,
        29: 7,
        30: 15,
        31: 31,
        # zupnik 2017
        #  0: 31,
        #  1: 31,
        #  2: 15,
        #  #  3: 3,
        #  #  4: 127,
        #  #  5: 7,
        #  #  6: 15,
        #  #  7: 31,
        #  8: 31,
        #  9: 7,
        #  10: 255,
        #  11: 3,
        #  12: 7,
        #  13: 255,
        #  14: 31,
        #  15: 15,
        #  #  16: 15,
        #  17: 3,
        #  18: 15,
        #  19: 15,
        #  20: 1,
        #  21: 255,
        #  22: 7,
        #  23: 31,
        #  #  24: 127,
        #  #  25: 15,
        #  #  26: 1,
        #  #  27: 63,
        #  #  28: 7,
        #  #  29: 3,
        #  #  30: 7,
        #  #  31: 127,
    }
    for id, value in data.items():
        zvezde_set(id, value)
        time.sleep(0.1)


def utrinek_start_left(address):
    packet(address, to_data(0))


def utrinek_start_right(address):
    packet(address, to_data(1))


def utrinek_set_mode(address, mode):
    packet(address, to_data(2) + to_data(mode))


def utrinek_set_random_min(address, min):
    packet(address, to_data(3) + to_data(min >> 8) + to_data(min & 0xFF))


def utrinek_set_random_max(address, max):
    packet(address, to_data(4) + to_data(max >> 8) + to_data(max & 0xFF))


def utrinek_set_address(address, new_address):
    packet(address, to_data(5) + to_data(new_address))


def luna_set_mode(mode):
    packet(0xE, to_data(mode << 4))


def luna_set_auto():
    luna_set_mode(0xE)


def luna_set_changing():
    luna_set_mode(0xF)


def luna_get_time():
    ser.reset_input_buffer()
    packet(0xE, to_data(1))
    data = [ord(x) for x in ser.read(8)]
    if data[0] == 1:
        print("Success")
        if data[4] & 0b00100000:
            print("Oscillator running")
        else:
            print("Oscillator not running")
    else:
        print("Fail")
    print(
        "20{}{}-{}{}-{}{} {}{}:{}{}:{}{}".format(
            data[7] >> 4,
            data[7] & 0xF,
            (data[6] >> 4) & 1,
            data[6] & 0xF,
            data[5] >> 4,
            data[5] & 0xF,
            data[3] >> 4,
            data[3] & 0xF,
            data[2] >> 4,
            data[2] & 0xF,
            (data[1] >> 4) & 0b0111,
            data[1] & 0xF,
        )
    )
    print(data)


def luna_oscillator_out():
    ser.reset_input_buffer()
    packet(0xE, to_data(3) + to_data(0b11000011))
    print(ord(ser.read()))


def luna_disable_out():
    ser.reset_input_buffer()
    packet(0xE, to_data(3) + to_data(0b10000000))
    print(ord(ser.read()))


def luna_set_time(year, month, day, hours, minutes, seconds):
    sec_byte = to_data(0b10000000 | ((seconds / 10) << 4) | (seconds % 10))
    min_byte = to_data(((minutes / 10) << 4) | (minutes % 10))
    hour_byte = to_data(((hours / 10) << 4) | (hours % 10))
    day_byte = to_data(0b00001000)
    date_byte = to_data(((day / 10) << 4) | (day % 10))
    month_byte = to_data(((month / 10) << 4) | (month % 10))
    year_byte = to_data((((year / 10) % 10) << 4) | (year % 10))

    ser.reset_input_buffer()
    packet(0xE, to_data(2) + sec_byte + min_byte + hour_byte + day_byte + date_byte + month_byte + year_byte)
    print(ord(ser.read()))


def snow_stars():
    packet(0xC)


def snow_snow():
    packet(0xB)


def snow_speed(s):
    packet(0xD, to_data(0) + to_data(s))


def snow_test(x, y):
    packet(0xD, to_data(1) + to_data(x) + to_data(y))


code.interact(local=locals())
