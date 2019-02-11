#!/bin/bash
if [ $# -eq 0 ]; then
  xdg-open . &> /dev/null
else
  for file in "$@"; do
    xdg-open "$file" &> /dev/null
  done
fi
#https://askubuntu.com/a/651181
