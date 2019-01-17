# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

export PATH=/usr/local/cuda-8.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH
export PATH="/home/meme/anaconda3/bin:$PATH"
export TERM=st-256color
export ZSH_CUSTOM=/home/meme/bin/ZSH_custom/
#custom variable for smart paths

fpath+=(/home/memebin/ZSH_custom/completions/)
source "/home/meme/bin/ZSH_custom/aliases.zsh"
source "/home/meme/bin/ZSH_custom/functions.zsh"
# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

setopt CHASE_LINKS

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
