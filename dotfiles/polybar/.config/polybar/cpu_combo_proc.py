#!/usr/bin/python3
# -*- coding: utf-8 -*-
import psutil
import subprocess as sp
perc = psutil.cpu_percent(interval = .5,percpu=True)
# perc = psutil.cpu_percent(interval = .1)
perc = sum(perc)/len(perc)
freq = psutil.cpu_freq().current / 1000

#most_mem_process = max(processes, key=lambda p: p.memory_full_info().uss)


def proc_out(proc):
    pinfo = proc.as_dict(attrs=['name'])
    pinfo['cpu'] = proc.memory_info()
    return(pinfo)
    # pinfo['vms'] = proc.memory_info().vms / (1024 * 1024)

[proc.memory_info() for proc in psutil.process_iter()]
[proc_out(proc) for proc in psutil.process_iter()]

all_p = [proc_out(proc) for proc in psutil.process_iter()]
cp = [x['cpu'] for x in all_p]
high_proc = all_p[cp.index(max(cp))]

# all_p['cpu']

prstr = "{:.2f}% @ {:.2f}Ghz".format(round(perc,2),round(freq,2))


if (high_proc['cpu'] > 20):
    prstr += " [{name} {cpu}%]".format(**high_proc)


def main():
    print(prstr)



if __name__ == '__main__':
    main()
