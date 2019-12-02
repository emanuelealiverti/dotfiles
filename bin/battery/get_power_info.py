#!/usr/bin/env python
# -*- coding: utf-8 -*-

import time
import subprocess as sp
import dbus


def run_dbus_method(bus_type, obj, path, interface, method, arg):
    if bus_type == "session":
        bus = dbus.SessionBus()
    elif bus_type == "system":
        bus = dbus.SystemBus()
    else:
        return None

    proxy = bus.get_object(obj, path)
    dbus_method = proxy.get_dbus_method(method, interface)

    return dbus_method(arg) if arg else dbus_method()


def find_battery_path():
    call = ['system', 'org.freedesktop.UPower',
            '/org/freedesktop/UPower', 'org.freedesktop.UPower',
            'EnumerateDevices', None]
    devices = run_dbus_method(*call)
    for i in devices:
        if 'BAT' in i:
            return str(i)
    return None


def main():
    bat_path = find_battery_path()
    call = ['system', 'org.freedesktop.UPower',
            bat_path, 'org.freedesktop.UPower.Device',
            'Refresh', None]

    run_dbus_method(*call)

    battery_watt_call = "upower -i $(upower -e | grep 'BAT') | grep 'energy-rate'"
    battery_watt = sp.check_output(battery_watt_call, shell=True)
    wattage = str(float(battery_watt.split(b" ")[-2]))

    battery_perc_call = "upower -i $(upower -e | grep 'BAT') | grep 'percentage'"
    battery_perc = sp.check_output(battery_perc_call, shell=True)
    perc = battery_perc.split(b" ")[-1].decode('utf-8')

    nowtime = str(time.time())

    save_info = '\t'.join([nowtime, wattage, perc, '\n'])

    with open('/tmp/battery_watt_usage.txt', 'a+') as f:
        f.write(save_info)

if __name__ == '__main__':
    main()
