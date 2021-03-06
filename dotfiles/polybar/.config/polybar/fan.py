#!/usr/bin/python3
# -*- coding: utf-8 -*-
tresh_temp = 60
tresh_fan = 1000
tresh_fan_p = 2600
import psutil
import subprocess as sp
fans = psutil.sensors_fans()
temp = psutil.sensors_temperatures()

speed = [entry.current for name, entries in fans.items() for entry in entries]
# cambia un po' a seconda del kernel, controlla
n_cpu_real = int(psutil.cpu_count()/2)
tt = [f.current for f in temp['coretemp'] if "Core" in f.label][:n_cpu_real]
# ll = [f.label for f in temp['coretemp'] if "Core" in f.label]

#Print according to temperature
prstr = ''
if sum(tt) > tresh_temp*len(tt):
    prstr+=' '+' '.join([str(round(f))+"°C" for f in tt])+' '

if max(speed) > tresh_fan_p:
    prstr += ' ' + ' ' .join([str(round(f)) for f in speed])
elif max(speed) > tresh_fan:
    prstr += ''



if len(prstr) > 1:
    prstr = '['+prstr+']'

# print(prstr)

#If fulll
def main():
    print(prstr)



if __name__ == '__main__':
    main()
