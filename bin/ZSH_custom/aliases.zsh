##++++++++++++++
# Custom paths 
##++++++++++++++

export cw=/home/meme/MEGA/Research/PAPERS/MIX_LL
export tr=/home/meme/MEGA/Research/TOREAD
export max=/home/meme/MEGA/Research/MEME_MAX
export thesis=/home/meme/MEGA/Unipd/PhD/THESIS/DISCUSSION/
export skew=/home/meme/MEGA/Research/PAPERS/SUN_MORTALITY/
export bart=/home/meme/Dropbox/BernardiDuranteAliverti_SUN/AddRegressTrees/
export bio=/home/meme/MEGA/Research/PAPERS/BtSNE
export sm=/home/meme/MEGA/Teaching/SocialMedia
##+++++++++++++++++++++++++
# Navigate to custom paths
##+++++++++++++++++++++++++

alias cdw='cd $cw' 
alias cdt='cd $tr' 
alias cdth='cd $thesis'
alias cdb='cd $bio'
alias cdp='cd /home/meme/MEGA/Research/PAPERS/' 
#alias cdth='cd $thesis; tmux new-session -A -s thesis vim Aliverti_thesis.tex' 
alias cdj='cd /home/meme/Dropbox/ALJD_fairness/JRSSA'


##++++++++
# ALIASES
##++++++++
alias -g ...='../..'
alias -g ....='../../..'

alias v='vim'
alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'
alias _='sudo'
alias lsd='ls -h --group-directories-first'
alias rm='rm -i'
alias cp='cp -i'
alias trash-empty='sudo rm -rf ~/.local/share/Trash/*'
alias wifiRes='sudo service network-manager restart'
alias gitPush='git push origin master'
alias gitR='git ls-files --deleted -z | xargs -0 git rm'
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -out -selection c'
alias pwdc='pwd | xclip -selection c' 
alias tg="tmux new-session -A -s Telegram vim /tmp/a.pdb +'exe VimCmdLineStartApp() | res 10'"
alias lmkrm='latexmk -c' 
alias l='k -h --group-directories-first --no-vcs'
#alias l='k' 
alias f='. ranger' 
alias greb='/home/meme/GIT/bat-extras/src/batgrep.sh'
alias pash='PASH_DIR=/home/meme/MEGA/000_Documents_personal/00_DOC/psw/ /home/meme/GIT/pash/pash'
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
alias pdf_tools="Rscript --vanilla /home/meme/bin/pdf_pageR.R"
#++++
#Based on custom prog, mostly symlinks
#++++
alias pwtop='_ powertop'
alias lls='ranger'
alias ccat='bat'
alias vlcACE='/snap/bin/acestreamplayer'
alias del='gvfs-trash'
alias ptop='glances'
alias qute='~/GIT/qutebrowser/.venv/bin/python3 -m qutebrowser'
