# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export LANG=en_US.UTF-8
export ZSH="/Users/meme/.oh-my-zsh"

export ZSH_CUSTOM=$HOME/bin/ZSH_custom/
ZSH_THEME="meme"
plugins=(macos zsh-history-substring-search extract vi-mode)

#source ~/.zplug/init.zsh
#zplug "jeffreytse/zsh-vi-mode"

source $ZSH/oh-my-zsh.sh
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

export PATH=/Users/meme/bin/:$PATH
export PATH=$HOME/bin/PDFs/:$PATH
export PATH='/Users/meme//Library/TinyTeX/bin/universal-darwin/':$PATH
export PATH='/opt/homebrew/bin':'/Users/meme/Library/Python/3.9/bin':$PATH
export PATH='/Applications/Julia-1.8.app/Contents/Resources/julia/bin/':$PATH
export EDITOR='/opt/homebrew/bin/nvim'
alias python=/opt/homebrew/bin/python3.9


export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/

source "$HOME/bin/ZSH_custom/aliases.zsh"
source "$HOME/bin/ZSH_custom/functions.zsh"

export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openblas/lib/pkgconfig"
export OPENBLAS_NUM_THREADS=4




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
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

# activate rbenv automatically
eval "$(rbenv init - zsh)"

export PATH=$PATH:/Users/meme/.spicetify

# Created by `pipx` on 2024-01-22 15:37:08
export PATH="$PATH:/Users/meme/.local/bin"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

