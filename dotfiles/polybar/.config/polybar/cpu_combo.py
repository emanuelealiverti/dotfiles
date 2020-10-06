#!/usr/bin/python3
# -*- coding: utf-8 -*-
import psutil
import subprocess as sp
perc = psutil.cpu_percent(interval = .5,percpu=True)
# perc = psutil.cpu_percent(interval = .1)
perc = sum(perc)/len(perc)
freq = psutil.cpu_freq().current / 1000

#most_mem_process = max(processes, key=lambda p: p.memory_full_info().uss)



prstr = "{:.2f}% @ {:.2f}Ghz".format(round(perc,2),round(freq,2))


def main():
    print(prstr)



if __name__ == '__main__':
    main()
