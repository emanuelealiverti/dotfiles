##++++++++++++++
# Custom paths 
##++++++++++++++

export tr=/home/meme/MEGA/Research/TOREAD
export prin=/home/meme/MEGA/Research/PAPERS/SUN_MORTALITY/
export th=/home/meme/MEGA/Teaching/UNIVE/SMRA/
export cw=/home/meme/MEGA/Teaching/UNIVE/SMRA/EXAMS/
export max=/home/meme/Dropbox/DynamicTensorCovid/
export pp='/home/meme/VE_GDrive/Analisi sistema offerta infanzia /'

##+++++++++++++++++++++++++
# Navigate to custom paths
##+++++++++++++++++++++++++

alias cdw='cd $cw' 
alias cdt='cd $tr' 
alias cdth='cd $th'
alias cdp='cd /home/meme/MEGA/Research/PAPERS/' 
alias cdww='cd $pp'
#alias cdth='cd $thesis; tmux new-session -A -s thesis vim Aliverti_thesis.tex' 


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

alias del='gio trash'
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
alias la='k -ah --group-directories-first --no-vcs'

#alias fd=fdfind
#alias l='k' 
#alias f='. ranger' 
alias t='todo.sh'
alias f='~/GIT/vifmimg/vifmrun .'
alias greb='/home/meme/GIT/bat-extras/src/batgrep.sh'
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
#alias ncm="tmux new -s SPOTIFY '/home/meme/bin/ncmpcpp.sh' && tmux a"
alias ncm="tmux new -A -s SPOTIFY '/home/meme/bin/ncmpcpp.sh'"
alias pdf_tools="Rscript --vanilla /home/meme/bin/pdf_pageR.R"
#++++
#Based on custom prog, mostly symlinks
#++++
alias pwtop='_ powertop'
alias ccat='bat'
