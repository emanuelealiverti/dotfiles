#!/usr/bin/env bash
file="/tmp/edit-with-vim_$(date +%F_%H:%M:%S)"
xclip -o > "$file"

st -e nvim "$file" -c "set filetype=wiki"
truncate -s -1 "$file"

xclip -selection c "$file"

