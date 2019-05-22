#++++++++++++++++++
## Custom Functions 
#++++++++++++++++++


#+++++++++++
# NAVIGATION
#++++++++++

cdl() {cd "$@" && ls -lhA}

cdd() {
	ID=$1
	cd /home/meme$(d | sed -n ''$(($ID+1>0?$ID+1:0))'p'| cut -d~ -f2-)
}

alias 0='cd $(cdd 0)'
alias 1='cd $(cdd 1)'
alias 2='cd $(cdd 2)'
alias 3='cd $(cdd 3)'
alias 4='cd $(cdd 4)'
alias 5='cd $(cdd 5)'

take() { mkdir -p $1; cd $1;}

thirdline() { awk '{if (NR%3==0){print "\033[31m" $0 "\033[0m"} else{print}}'; }

pdf_ren(){'/home/meme/bin/pdf_rename.sh' $@ 2>/dev/null}

#++++++++++
# 
#+++++++++++
R_localbuild() {
	if [ ! -d ./lib ]; then
		mkdir lib
	fi
	cd $1
	R -e "Rcpp::compileAttributes()"
	cd ..
	R CMD build $1
	R CMD INSTALL -l lib "$1"

}


bianca_webcam() {
	ssh bianca ffmpeg -an -f video4linux2 -s 640x480 -i /dev/video0 -r 10 -b:v 500k -f matroska - | mplayer - -idle -demuxer matroska 
}


ssh_aws() {

	if [[ -z "${AWS_IP}" && -z "$*" ]]; then
		echo "aws ip addr missing!"
		return 0
	fi

	if [[ -z "${AWS_IP}" ]]; then
		AWS_IP="$1"
		ssh ec2-user@ec2-$AWS_IP.eu-west-1.compute.amazonaws.com -vvv
		AWS_HOST="ec2-user@ec2-$AWS_IP.eu-west-1.compute.amazonaws.com" 
	else
		ssh ec2-user@ec2-$AWS_IP.eu-west-1.compute.amazonaws.com -vvv
	fi

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

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ZSH stats: https://wikimatze.de/show-the-most-common-used-terminal-commands/
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
zsh-stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Change mac address
# source: https://twitter.com/mgechev/status/1130441471105093632?s=09
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

changeMac() {
  local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo ifconfig en0 ether $mac
  sudo ifconfig en0 down
  sudo ifconfig en0 up
  echo "Your new physical address is $mac"
}

