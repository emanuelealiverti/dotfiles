# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/meme/.oh-my-zsh"

export ZSH_CUSTOM=$HOME/bin/ZSH_custom/
ZSH_THEME="meme"

plugins=(osx vi-mode)

source $ZSH/oh-my-zsh.sh

export PATH=/Users/meme/bin/:$PATH
export PATH=$HOME/bin/PDFs/:$PATH
export PATH='/Users/meme//Library/TinyTeX/bin/universal-darwin/':$PATH
export PATH='/opt/homebrew/bin':'/Users/meme/Library/Python/3.9/bin':$PATH

export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/

source "$HOME/bin/ZSH_custom/aliases.zsh"
source "$HOME/bin/ZSH_custom/functions.zsh"




#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Exclude filetypes from prog. complete
# does not work with scripts, so just copy them into /usr/bin or something
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|pdf|fls|blg|synctex):source-files' '*:all-files'

zstyle ':completion:*:*:open:*' file-patterns '^*.(aux|log|tex):source-files' '*:all-files'



#++++++++++
## VI mode options 
#++++++++++
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}+%f"


export KEYTIMEOUT=1




source ~/GIT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
