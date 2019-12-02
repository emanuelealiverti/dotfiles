#!/bin/bash
cp -r /home/meme/dotfiles/* .
rsync -rtv --delete /home/meme/bin/ ./bin/
rsync -rtv --delete /home/meme/MEGA/000_Documents_personal/polybar/ ./polybar/.config/
# add autostart
rsync -rvcm --compare-dest=/etc/xdg/autostart ~/.config/autostart .
