#!/bin/bash

### Script to backup dot files and config

killall mega-cmd-server
sleep 1 
mega-sync && exit


