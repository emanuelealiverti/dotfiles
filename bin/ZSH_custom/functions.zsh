#++++++++++++++++++
## Custom Functions 
#++++++++++++++++++
#eval "$(fasd --init zsh-hook)"


#+++++++++++
# NAVIGATION
#++++++++++
cdl() {cd "$@" && ls -lhA}

cdd() {
	cd $(dirs -lp | fzf)
}

take() { mkdir -p $1; cd $1;}

thirdline() { awk '{if (NR%3==0){print "\033[31m" $0 "\033[0m"} else{print}}'; }


#++++++++++++++++++
# Clean tex compile
#++++++++++++++++++
clean_tex(){ latexmk -pdf $1; latexmk -c }

bianca_webcam() {
	ssh bianca ffmpeg -an -f video4linux2 -s 640x480 -i /dev/video0 -r 10 -b:v 500k -f matroska - | mplayer - -idle -demuxer matroska 
}


notify_at() { echo 'notify-send "'$1'"' | at $2}



#++++++++++++++
# Vim over scp
#++++++++++++++

vim_scp () {
	user=$(awk '/^Host '$1'$/{x=1}x&&/User/{print $2;exit}' /home/meme/.ssh/config)
	str="vim scp://$1///home/$user/$2"
	eval $str

}

#++++++++++++++++++++++++++++++++++
# VIFM with image support and setwd
#++++++++++++++++++++++++++++++++++
#f()
#{
    #local dst="$(command ~/GIT/vifmimg/vifmrun --choose-dir - "$@")"
    #cd "$dst"
#}

#+++++++
# Update
#+++++++
my_upd() {
       case "$1" in
            -u) tmux new-session "sudo apt-get update && sudo apt-get upgrade; read" ;;
            -d|dist) tmux new-session "sudo apt-get update && sudo apt-get dist-upgrade; read" ;;
            -c|clean) tmux new-session "sudo apt-get autoclean && sudo apt-get autoremove; read" ;;
            *) echo "specify option -u,-d or -c" 
        esac
}

#+++++++++++++++++++++++++
# Compress recoreded video
#+++++++++++++++++++++++++
compress_video(){
	# source: https://video.stackexchange.com/a/14584
	ffmpeg -i $1  -c:a opus -b:a 40k -pix_fmt yuv420p -c:v libx264 -preset slower -x264-params keyint=1000:nr=200 -crf 25 $2.mkv
}
