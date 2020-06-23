# -*- coding: utf-8 -*-
import psutil
import struct
import subprocess as sp
battery = psutil.sensors_battery()
plugged = battery.power_plugged
percent = round(battery.percent)
time = battery.secsleft
m = divmod(time, 60)[0]
h, m = divmod(m, 60)
battery_watt_call = "upower -i $(upower -e | grep 'BAT') | grep 'energy-rate'"
battery_watt = sp.check_output(battery_watt_call, shell=True)
# battery_watt
wattage = (str(battery_watt.split(b" ")[-2]))
wattage = float(wattage[2:-1].replace(",","."))
#Icon according to batt status
iconB = " "
if percent < 75:
    iconB = " "

if percent < 50:
    iconB = " "

if percent < 25:
    iconB = " "

if percent < 15:
    iconB = " "

iconT = " "
if h < 4:
    iconT = " "
if h < 1:
    iconT = " "


#If fulll
def main():
    if plugged==True and percent==100.0:
        #Print nothing or plug when full?
        print('')
        pass
    elif plugged==True and percent!=100:
        # When plugged, the battery icon is not very useful
        # print(str(iconB) + str(round(percent))+ '% ')
        print(' ' +str(round(percent))+ '%')
    else:
        # f"{h:d}:{m:02d}"
        timer = '{:d}:{:02d}'.format(h,m)
        print(str(iconB) + str(round(percent))+ '% ' + iconT + timer + '  ' +str(round(wattage,2)))


timer = '{h:d}'+':'+str(m)

if __name__ == '__main__':
    main()
