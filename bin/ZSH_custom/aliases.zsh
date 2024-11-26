##++++++++++++++
# Custom paths 
##++++++++++++++

export tr=$HOME/MEGA/Research/TOREAD
export bnp=$HOME/MEGA/Research/PAPERS/E_FDP_Mortality/
export bart=$HOME/Dropbox/BernardiDuranteAliverti_SUN/AddRegressTrees/




##+++++++++++++++++++++++++
# Navigate to custom paths
##+++++++++++++++++++++++++

alias cdw='cd $cw' 
alias cdt='cd $tr' 
alias cdth='cd $th'
alias cdp='cd $HOME/MEGA/Research/PAPERS/' 


##++++++++
# ALIASES
##++++++++
alias -g ...='../..'
alias -g ....='../../..'

alias vim='/opt/homebrew/bin/nvim'
alias v='vim'
alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'
alias lsd='ls -h --group-directories-first'
alias rm='rm -i'
alias cp='cp -i'


alias l='eza -l'
alias lt='eza -laT'
alias qw='quick-look'

# OSX specific
#alias del='gio trash'
alias del='trash'
alias ww='quick-look'

alias gitPush='git push origin master'
alias gitR='git ls-files --deleted -z | xargs -0 git rm'

alias pwdc='printf "%q\n" "$(pwd)" | pbcopy'

alias lmkrm='latexmk -c' 
alias la='k -ah --group-directories-first --no-vcs'

alias timer='termdown'

#+++++++
# TMUX
# ++++++
alias ta='tmux a'
alias tl='tmux ls'
alias tn='tmux new -s'

alias x='unarchive'
alias xz='archive'

