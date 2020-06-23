#!/bin/bash
rsync -rtv --delete /home/meme/dotfiles/  ./dotfiles/
rsync -rtv --delete /home/meme/bin/ ./bin/
