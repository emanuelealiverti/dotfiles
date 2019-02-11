#!/bin/bash

### Script to backup dot files and config

sudo service mpd stop
killall xbindyes
killall mopidy
killall mpd
sleep 1;

cd /tmp/
nohup mopidy &
sleep 1;
mpd
xbindkeys

ncmpcpp -b ~/.ncmpcpp/keybind
rm -rf ~/.cache/mopidy/spotify/*

sudo service mdp stop
killall xbindkeys
killall mopidy
killall mpd
