#!/bin/bash
tod=$(date +"%Y%m%d")
tlmgr info --only-installed | awk '{print $2}' | sed 's/.$//' > pack$tod.txt
