#!/usr/bin/python3.5
""
" Takes all cbr and atttemps to order files inside "
""
import os,re,sys
from PyPDF2 import PdfFileMerger

def natural_sort(l): 
    convert = lambda text: int(text) if text.isdigit() else text.lower() 
    alphanum_key = lambda key: [convert(c) for c in re.split('([0-9]+)', key)] 
    return sorted(l, key=alphanum_key)

def rspace(s):
    return s.replace(' ','_')

def pdf_merge(pdfs,fold):
    merger = PdfFileMerger()
    for pdf in pdfs:
        merger.append(pdf)
    merger.write("../"+fold+".pdf")
    merger.close()

def fix_names_fold(fold):
    # os.system('unrar x -ad ' + fold + ".rar")
    os.chdir(fold)
    [os.rename(f,rspace(f)) for f in os.listdir()]

    pdfs=[f for f in os.listdir() if "pdf" in f]

    if len(pdfs) == 1:
        os.rename(pdfs[0], "../" +fold+".pdf")
    elif len(pdfs) > 1:
        pdf_merge(pdfs,fold)

    figs=[f for f in os.listdir() if "jpg" in f.lower()]

    if len(figs) > 1:
        form2(fold)
        os.system('rar a ' + fold + '.rar *')
        os.rename(fold + ".rar", "../"+fold+".cbr")
    os.chdir("..")

def form2(fold):
    tmp=natural_sort(os.listdir())
    [os.rename(tmp[i], "{:03}.jpg".format(i)) for i in range(len(tmp))]

# os.chdir("..")
# os.getcwd()

def main(args=None):
    pp = natural_sort([d for d in os.listdir() if "RM" in d])
    # cb = [f for f in os.listdir() if "cbr" in f]
    # [os.rename(f, f.replace("cbr","rar")) for f in cb]
    # ff = natural_sort([f.split(".")[0] for f in os.listdir() if "rar" in f])
    [fix_names_fold(dd) for dd in pp]

fix_names_fold(pp[0])
if __name__ == '__main__': sys.exit(main())

