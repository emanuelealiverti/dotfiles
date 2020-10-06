# -*- coding: utf-8 -*-
import psutil
import struct
import subprocess as sp
from shutil import which

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

# Shot me a notification when battery is about to die running
batt_comm = "dunstify 'LOW BATTERY' -r 97" 

# Bluetooth indicator
bt_devices = {'name': 'Aukey', 'mac': '5C:FB:7C:3C:4F:59'}
bt_connected = "no"
bt_id = ""
for dev in bt_devices:
    name, mac = bt_devices['name'], bt_devices['mac']
    cmd_bt_connected = 'bluetoothctl info ' + mac + ' | grep -i connected | awk \'{print $2}\''
    t = sp.Popen([cmd_bt_connected], stdout=sp.PIPE, stderr=sp.STDOUT, shell=True)
    bt_connected = t.stdout.read().decode('utf-8').strip('\n')
    if bt_connected == "yes":
        bt_id = "\u200A[]"



#Icon according to batt status
iconB = " "
if percent < 75:
    iconB = " "

if percent < 50:
    iconB = " "

if percent < 25:
    iconB = " "

if percent < 10:
    iconB = " "




iconT = " "
if h < 4:
    iconT = " "
if h < 1:
    iconT = " "


# If full
def main():
    if plugged==True and percent==100.0:
        #Print nothing or plug when full?
        print('' + bt_id)
        pass

    elif plugged==True and percent!=100:
        # When plugged, the battery icon is not very useful
        # print(str(iconB) + str(round(percent))+ '% ')
        print(' ' +str(round(percent))+ '%' + bt_id)

    elif plugged==False and percent <= 5:
        sp.check_output(batt_comm, shell=True)

    else:
        timer = '{:d}:{:02d}'.format(h,m)
        print(str(iconB) + str(round(percent))+ '% ' + iconT + timer + '  ' + str(round(wattage,2)) + bt_id)


# timer = '{h:d}' + ':' + str(m)

if __name__ == '__main__':
    main()
