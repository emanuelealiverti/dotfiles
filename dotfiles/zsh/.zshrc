# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export LANG=en_US.UTF-8

#export ZSH="/Users/meme/.oh-my-zsh"
#export ZSH_CUSTOM=$HOME/bin/ZSH_custom/
#ZSH_THEME="meme"
#plugins=(macos zsh-history-substring-search extract vi-mode zsh-ssh)
#source $ZSH/oh-my-zsh.sh

#source ~/.zplug/init.zsh
#zplug "jeffreytse/zsh-vi-mode"

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
#export OPENBLAS_NUM_THREADS=4
export OPENBLAS_NUM_THREADS=8




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

