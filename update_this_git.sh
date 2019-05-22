#!/bin/bash
cp -r /home/meme/dotfiles/* .
rsync -rtv --delete /home/meme/bin/ ./bin/
# add autostart
rsync -rvcm --compare-dest=/etc/xdg/autostart ~/.config/autostart .
