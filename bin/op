#!/bin/bash
#opc="mimeopen"
opc="xdg-open"
if [ $# -eq 0 ]; then
  $opc . &> /dev/null
else
  for file in "$@"; do
    $opc "$file" &> /dev/null
    sleep 0.1
  done
fi
#https://askubuntu.com/a/651181
