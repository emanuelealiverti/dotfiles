#!/bin/python3.5

import sys
import dbus
import argparse

trunclen = 25
# play_pause = fix_string(u'\u25B6,\u23F8') # first character is play, second is paused


tr_h = int(round(trunclen/2))

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        'org.mpris.MediaPlayer2.spotify',
        '/org/mpris/MediaPlayer2'
    )

    spotify_properties = dbus.Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )

    metadata = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    status = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'PlaybackStatus')

    # play_pause = play_pause.split(',')

    if status == 'Playing':
        play_pause = ""
    elif status == 'Paused':
        play_pause = ""
    else:
        play_pause = "" 

    artist =(metadata['xesam:artist'][0])
    song = (metadata['xesam:title'])

    if len(song)+len(artist) > trunclen:
        if len(song)> tr_h:
            song = song[0:int(tr_h-1)]
            song += '...' 
        if len(song)+len(artist) > trunclen and len(artist)> tr_h:
            artist = artist[0:tr_h]
        # if len(song) + len(artist) > trunclen:
            # artist = artist[0:tr_h]
        # artist += '...' 

    out="{} {} - {}".format(play_pause, artist.lower().capitalize(),song.lower().capitalize()) 
    print(out)

except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print('')
    else:
        print(e)

