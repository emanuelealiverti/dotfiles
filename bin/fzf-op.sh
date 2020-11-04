#!/usr/bin/bash

#prog=$(fd -E GIT -E R -E Dropbox -E Pictures --type f| fzf --reverse --border | sed 's/ /\\ /g')
# chech ~/.fdignore
prog=$(fd -j 4 \
	--type f . $HOME | \
	/home/meme/.fzf/bin/fzf \
	--reverse --border \
	--history=$HOME/.fzf_hist --keep-right)
nohup xdg-open "$prog" &> /tmp/nohup.out


