#!/bin/bash

#Spotify playsist support not provided through the official relase. 
#Therefore

# apt-get remove mopidy-spotify
# apt-get install python-spotify
# One solution is (23/07/109)
# https://github.com/kingosticks/mopidy-spotify/tree/fix/web_api_playlists

# e.g. git clone https://github.com/kingosticks/mopidy-spotify.git
# git chechout fix/web_api_playlist_v2
# sudo pip install .

sudo service mpd stop
killall xbindyes
killall mopidy
killall mpd
sleep 1;

cd /tmp/
nohup mopidy &
echo "Mopidy Spotify with spotify playlist support takes a while"
# This sleep waits until mopidy is ready for connetion. Maybe can be reduced... 
sleep 10
mpd
xbindkeys

ncmpcpp -b ~/.ncmpcpp/keybind
rm -rf ~/.cache/mopidy/spotify/*

sudo service mdp stop
killall xbindkeys
killall mopidy
killall mpd
