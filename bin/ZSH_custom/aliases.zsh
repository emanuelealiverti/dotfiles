##++++++++++++++
# Custom paths 
##++++++++++++++

export tr=$HOME/MEGA/Research/TOREAD
export max=$HOME/MEGA/Research/MEME_MAX
export prin=$HOME/MEGA/Research/PAPERS/LocalMortality
export bnp=$HOME/MEGA/Research/PAPERS/E_FDP_Mortality/
export bart=$HOME/Dropbox/BernardiDuranteAliverti_SUN/AddRegressTrees/
export sm=$HOME/MEGA/Teaching/UNIPD/SocialMedia
export th=/Users/meme/MEGA/Teaching/UNIVE/SMRA/2021
export cw=/Users/meme/MEGA/Research/PAPERS/MIX_LL/PAPER_app/MAJOR/



##+++++++++++++++++++++++++
# Navigate to custom paths
##+++++++++++++++++++++++++

alias cdw='cd $cw' 
alias cdt='cd $tr' 
alias cdth='cd $th'
alias cdp='cd $HOME/MEGA/Research/PAPERS/' 
#alias cdth='cd $thesis; tmux new-session -A -s thesis vim Aliverti_thesis.tex' 


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

#alias del='gio trash'
alias del='trash'

alias gitPush='git push origin master'
alias gitR='git ls-files --deleted -z | xargs -0 git rm'

alias pwdc='pwd | pbcopy'

alias lmkrm='latexmk -c' 
alias la='k -ah --group-directories-first --no-vcs'

#+++++++
# TMUX
# ++++++
alias ta='tmux a'
alias tl='tmux ls'
alias tn='tmux new -s'

alias x='unarchive'
alias xz='archive'

