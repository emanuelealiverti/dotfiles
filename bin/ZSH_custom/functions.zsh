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
cdd_old() {
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

#+++++++++++++++++++++++++++++++++++++++++++++
# Very useful functions to make local packages
# Took me ages to get complieattr` 
#+++++++++++++++++++++++++++++++++++++++++++++
print_bord() {
	printf %"$COLUMNS"s |tr " " "-"
	echo $@
	printf %"$COLUMNS"s |tr " " "-"
}

R_localbuild() {

	if [ ! -d ./lib ]; then
		print_bord "CREATING LIB DIRECTORY"
		mkdir lib
	else
		print_bord "LIB DIRECTORY ALREADY EXISTS - cleaning"
		rm -rf ./lib/$1
	fi

	oldd=$(pwd)
	cd $1
	print_bord "Compiling attributes"
	R -q -e "Rcpp::compileAttributes(verbose=T)"
	#cd ..
	cd $oldd
	print_bord "BUILDING"

	R CMD build --no-build-vignettes --no-manual $1

	print_bord "BUILD SUCCESSFUL. REMOVING OLD PACKAGE AND INSTALLING"
	R CMD REMOVE -l lib "$1"
	R CMD INSTALL --no-docs --no-html -l lib "$1"
	#cd $oldd

}

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

#+++++++++++++++++++++++++++++
# Remove metadata etc from pdf
#+++++++++++++++++++++++++++++

clean_pdf() {
	python2 $(which mat)
}

#+++++
# WIFI
#+++++
wl(){
	local ssid
	local conn

	nmcli device wifi rescan > /dev/null
	ssid=$(nmcli device wifi list | tail -n +2 | grep -v '^  *\B--\B' | fzf -m | sed 's/^ *\*//' | awk '{print $1}')

	if [ "x$ssid" != "x" ]; then
		# check if the SSID has already a connection setup
		conn=$(nmcli con | grep "$ssid" | awk '{print $1}' | uniq)
		if [ "x$conn" = "x$ssid" ]; then
			echo "Please wait while switching to known network $ssid…"
			# if yes, bring up that connection
			nmcli con up id "$conn"
		else
			echo "Please wait while connecting to new network $ssid…"
			# if not connect to it and ask for the password
			nmcli device wifi connect "$ssid"
		fi
	fi
}
