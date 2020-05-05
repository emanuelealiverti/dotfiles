# ########################################
# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
# ########################################

setopt HIST_IGNORE_ALL_DUPS
bindkey -v
# Recent updates of zim require also .zlogin and .zshenv
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh


# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi


# Setup fzf
# ---------
#https://github.com/junegunn/fzf
if [[ ! "$PATH" == */home/meme/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/meme/.fzf/bin"
fi
source "/home/meme/.fzf/shell/key-bindings.zsh"
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#
#Gradually removing anaconda
# `python3.x -m pip install numpy --user `
# to install into ~/.local/bin
#export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH
#export PATH="/home/meme/anaconda3/bin:$PATH"
export PATH=/home/meme/bin/PDFs/:$PATH
export PATH='/usr/local/texlive/2019/bin/x86_64-linux':$PATH

export TERM=screen-256color
export ZSH_CUSTOM=/home/meme/bin/ZSH_custom/
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/
#custom variable for smart paths

fpath+=(/home/memebin/ZSH_custom/completions/)
source "/home/meme/bin/ZSH_custom/aliases.zsh"
source "/home/meme/bin/ZSH_custom/functions.zsh"


setopt CHASE_LINKS
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'


#################################
## Completion for kill processes
################################

zstyle ':completion:*:processes' command 'NOCOLORS=1 ps -U $(whoami)|sed "/ps/d"'
zstyle ':completion:*:processes' insert-ids menu yes select
zstyle ':completion:*:processes-names' command 'NOCOLORS=1 ps xho command|sed "s/://g"'
zstyle ':completion:*:processes' sort false


#++++++++++
## VI mode options 
#++++++++++

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
bindkey -v
export KEYTIMEOUT=1

#################################
## Custom lib 
################################

source /home/meme/bin/ZSH_custom/plugins/k.sh

#####################
## History with match
#####################

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
