# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export LANG=en_US.UTF-8



###################
# OH-my-zsh setup #
###################
export ZSH="/Users/meme/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/bin/ZSH_custom/
ZSH_THEME="meme"
plugins=(macos zsh-history-substring-search extract vi-mode zsh-ssh)
source $ZSH/oh-my-zsh.sh
source "$HOME/bin/ZSH_custom/aliases.zsh"
source "$HOME/bin/ZSH_custom/functions.zsh"

#source ~/.zplug/init.zsh
#zplug "jeffreytse/zsh-vi-mode"

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down



#################
# various paths #
#################
export PATH=/Users/meme/bin/:$PATH
export PATH=$HOME/bin/PDFs/:$PATH
export PATH='/Users/meme//Library/TinyTeX/bin/universal-darwin/':$PATH
export PATH='/opt/homebrew/bin':'/Users/meme/Library/Python/3.9/bin':$PATH
#export PATH='/Applications/Julia-1.8.app/Contents/Resources/julia/bin/':$PATH
export PATH=$PATH:/Users/meme/.spicetify
export EDITOR='/opt/homebrew/bin/nvim'
alias python=/opt/homebrew/bin/python3.9


###################
# Compile options #
###################
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/
export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openblas/lib/pkgconfig"
#export OPENBLAS_NUM_THREADS=4
export OPENBLAS_NUM_THREADS=8




#########################################
# Exclude filetypes from prog. complete #
#########################################
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|pdf|fls|blg|synctex):source-files' '*:all-files'

zstyle ':completion:*:*:open:*' file-patterns '^*.(aux|log|tex):source-files' '*:all-files'



####################
# VI mode options  #
####################
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}+%f"

#######
# FZF #
#######
export KEYTIMEOUT=1
source ~/GIT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

# activate rbenv automatically
eval "$(rbenv init - zsh)"

