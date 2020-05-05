#!/bin/bash
rsync -rtv --delete /home/meme/dotfiles/  ./dotfiles/
rsync -rtv --delete /home/meme/bin/ ./bin/
rsync -rtv --delete /home/meme/MEGA/000_Documents_personal/polybar/ ./polybar/.config/
# add autostart
rsync -rvcm --compare-dest=/etc/xdg/autostart ~/.config/autostart .
