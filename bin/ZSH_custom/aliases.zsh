##++++++++++++++
# Custom paths 
##++++++++++++++

export cw=/home/meme/MEGA/Research/PAPERS/MIX_LL
export tr=/home/meme/MEGA/Research/000_CurrentWork/TOREAD
export max=/home/meme/MEGA/Research/MEME_MAX
export skew=/home/meme/MEGA/Research/PAPERS/SUN_FERTILIY

##+++++++++++++++++++++++++
# Navigate to custom paths
##+++++++++++++++++++++++++

alias cdw='cd $cw' 
alias cdt='cd $tr' 


##++++++++
# ALIASES
##++++++++
alias -g ...='../..'
alias -g ....='../../..'


alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'
alias _='sudo'
# Based on "defualt" commands, in general remap a commad to have some options as predef
alias lsd='ls -h --group-directories-first'
alias rm='rm -i'
alias trash-empty='sudo rm -rf ~/.local/share/Trash/*'
alias wifiRes='sudo service network-manager restart'
alias gitPush='git push origin master'
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -out -selection c'
alias pwdc='pwd | xclip -selection c' 
#alias tg='tmux new-session -A -s Telegram telegram-cli -NW -l 0'
alias tg="tmux new-session -A -s Telegram vim /tmp/a.pdb +'exe VimCmdLineStartApp() | res 10'"
alias lmkrm='latexmk -c' 
alias vcal='vim -c :Calendar' 
alias k='k -h --group-directories-first --no-vcs'
alias l='k' 

#+++++++
# TMUX
# ++++++
alias ta='tmux a'
alias tl='tmux ls'
alias tn='tmux new -s'

alias x='unarchive'
alias xz='archive'

#++++
#Based on personal scripts
#++++
alias op='/home/meme/bin/op.sh'
alias dim='/home/meme/bin/dim.sh'
#alias ncm="tmux new -s SPOTIFY '/home/meme/bin/ncmpcpp.sh' && tmux a"
alias ncm="tmux new -A -s SPOTIFY '/home/meme/bin/ncmpcpp.sh'"
alias f="/home/meme/bin/fff"

#++++
#Based on custom prog, mostly symlinks
#++++
alias pwtop='_ powertop'
alias lls='ranger'
alias ccat='pygmentize'
alias vlcACE='/snap/bin/acestreamplayer'
alias del='gio trash'
alias ptop='glances'
