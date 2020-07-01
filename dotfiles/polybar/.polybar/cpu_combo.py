#!/usr/bin/python3
# -*- coding: utf-8 -*-
import psutil
import subprocess as sp
perc = psutil.cpu_percent(interval = .1,percpu=True)
perc = sum(perc)/len(perc)
freq = psutil.cpu_freq().current / 1000

prstr = "{:.2f}% @ {:.2f}Ghz".format(round(perc,2),round(freq,2))

# print(prstr)

#If fulll
def main():
    print(prstr)



if __name__ == '__main__':
    main()
