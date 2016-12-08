#!/usr/bin/env python

import sys

MOD = 42524
DAY = 24 * 60

def is_leap(year):
    if year % 4 == 0 and (year % 100 != 0 or year % 400 == 0):
        return True
    return False


known_year = 1900
known_month = 1
known_day = 1
def moon(year, month, day):
    n = 0

    n += (year - known_year) * 365 * DAY
    n += (((year - 1 - known_year) / 4) + 1) * DAY
    n -= (((year - 1 - known_year) / 100) + 1) * DAY
    if year > 2000:
        n += (((year - 1 - 2000) / 400) + 1) * DAY

    print(n)

    calculation_month = known_month
    while calculation_month < month:
        if (calculation_month < 8 and calculation_month % 2 == 1) or (calculation_month >= 8 and calculation_month % 2 == 0):
            n += 31 * DAY
        elif calculation_month == 2:
            if is_leap(year):
                n += 29 * DAY
            else:
                n += 28 * DAY
        else:
            n += 30 * DAY
        calculation_month += 1

    print(n)

    n += (day - known_day) * DAY

    print(n)

    print(float(n % MOD)/(DAY))
    print((n % MOD + DAY/2)/(DAY))
    print((((n % MOD + DAY/2)/DAY + 1)/3) % 10)

year = int(sys.argv[1])
month = int(sys.argv[2])
day = int(sys.argv[3])
moon(year, month, day)
