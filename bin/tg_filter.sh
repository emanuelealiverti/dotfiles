#!/bin/bash
#++++++++++++++++++++++++
# Scarica ultimi messaggi
#++++++++++++++++++++++++
rm -rf /tmp/hist.txt /tmp/id.txt
telegram-cli -NWC -l 0 -e 'history eDiCoLa-WapPoSa' > /tmp/hist.txt
# Filtra con sed
awk '/Settimana|Repubblica|Corriere/' /tmp/hist.txt | awk '{print $1}' | sed '/^[^0-9]/d'  > /tmp/id.txt
#++++++++++++++++++++++++++++++
# Loop over all indexes, if any
#++++++++++++++++++++++++++++++
cat /tmp/id.txt | while read line
do
	cc='fwd Meme '$line''
	telegram-cli -NWC -l 0 -e "$cc"
	sleep 1
done
#rm -rf /tmp/hist.txt /tmp/id.txt
