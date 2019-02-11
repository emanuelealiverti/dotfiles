#++++++++++++++++++
## Custom Functions 
#++++++++++++++++++


#+++++++++++
# NAVIGATION
# ++++++++++
cdd() {cd "$@" && ls -lhA;}

cd_dir() {
	ID=$1
	cd /home/meme$(d | sed -n ''$(($ID+1>0?$ID+1:0))'p'| cut -d~ -f2-)
}
alias 0='cd $(cd_dir 0)'
alias 1='cd $(cd_dir 1)'
alias 2='cd $(cd_dir 2)'
alias 3='cd $(cd_dir 3)'
alias 4='cd $(cd_dir 4)'
alias 5='cd $(cd_dir 5)'

take(){ mkdir -p $1; cd $1;}

thirdline() { awk '{if (NR%3==0){print "\033[31m" $0 "\033[0m"} else{print}}'; }

pdf_ren(){'/home/meme/bin/pdf_rename.sh' $@ 2>/dev/null}

#++++++++++
# r, CLUSTER
#+++++++++++
Rcust() {
	if [ ! -d ./lib ]; then
		mkdir lib
		# Control will enter here if $DIRECTORY doesn't exist.\
		fi
		R CMD INSTALL -l lib "$1"
	}


	bianca_webcam() {
		ssh bianca ffmpeg -an -f video4linux2 -s 640x480 -i /dev/video0 -r 10 -b:v 500k -f matroska - | mplayer - -idle -demuxer matroska }

		## dirs -v | sed -n 3p | cut -c 3-

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

		##
		## Vim over scp
		#
		vim_scp () {
			user=$(awk '/^Host '$1'$/{x=1}x&&/User/{print $2;exit}' /home/meme/.ssh/config)
			str="vim scp://$1///home/$user/$2"
			eval $str

		}

