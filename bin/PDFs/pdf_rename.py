#!/usr/bin/python3.5
"""
Rename pdf
"""
#Define all badwords
words="Printed|preprint|arXiv|content|journal|Rejoinder|Science|Annals|Communication|manuscript|department|editor|vol|doi|download|publisher|author|paper"
words = words.split("|")
numb = [str(i) for i in range(10)]
symb=[s for s in "([()?/]+)|"]
words = words + numb + symb

#max lentgh
maxL = 75

import subprocess as sp
import argparse
import os
import sys
from prettytable import PrettyTable
def rspace(s):
    return s.replace(' ','_')

def smartconv(paper):
    text=sp.check_output("pdftotext -l 1 " + paper + ' -',shell=True)
    return str(text.decode('utf-8'))

def title_meta(paper):
    text=sp.check_output("pdfinfo " + paper + " | grep Title: | sed 's/Title:[ ]*//'",shell=True).decode('utf-8').split('\n')
    return text[0]

def makeparser():
    parser = argparse.ArgumentParser(description='Rename PDF title')
    parser.add_argument('ff', metavar='File Names', type=str, nargs='+', help='File names!')
    parser.add_argument('-t','--test',const=1, default=None, nargs='?', help='Rename files, insead of only showing names')
    parser.add_argument('-s','--spaces',const=None, default=1, nargs='?', help='Remove names with spaces. Disable with -s')
    return parser

def title(paper):
    tit = title_meta(paper)
    badW = [w for w in words if w.lower() in tit.lower()]
    #Check if the xml attr is stupid or empty
    if len(badW) > 0 or len(tit) < 2:
        tit=title_h(paper)

    if(len(tit) > 2):
        return str(tit).title()[:maxL]
    else:
        return paper

def title_h(paper):
    tmp=smartconv(paper).split('\n')
    tmp_len = [len(l) for l in tmp]
    index = [i for i, x in enumerate(tmp_len) if x > 10]
    final_name=''
    for i in index[:10]:
        final_name = '_'.join(tmp[i].split())
        badW = [w for w in words if w.lower() in final_name.lower()]
        if len(badW) == 0:
            break
    return final_name.replace(",","")

def backup(files):
    os.system('mkdir -p OLD_NAMES')
    [os.system("cp " + f + " OLD_NAMES/") for f in files]

def main(args=None):
    P = makeparser()
    A = P.parse_args(args=args)
    # Keep only pdf files
    A.ff = [f for f in A.ff if '.pdf' in f]

    # Remove spaces if present
    if A.spaces:
        [os.rename(f,rspace(f)) for f in A.ff if ' ' in f]
        A.ff = [rspace(f) for f in A.ff]

    if A.test:
        backup(A.ff)
    #Show old and new names
    tt = PrettyTable(['Old Names','New Names'])
    for f in A.ff:
        newt = title(f)
        tt.add_row([f] + [newt])
        if A.test:
            os.rename(f, rspace(newt) + ".pdf")
            print("File Renamed")
    print(tt)


if __name__ == '__main__': sys.exit(main())
