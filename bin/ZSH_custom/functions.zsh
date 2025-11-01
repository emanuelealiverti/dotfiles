#++++++++++++++++++
## Custom Functions 
#++++++++++++++++++
#eval "$(fasd --init zsh-hook)"


#+++++++++++
# NAVIGATION
#++++++++++
cdl() {cd "$(dirname "$1")"}

cdd() {
	cd "$(dirs -lp | fzf)"
}

take() { mkdir -p $1; cd $1;}

thirdline() { awk '{if (NR%3==0){print "\033[31m" $0 "\033[0m"} else{print}}'; }

#++++++++++++++++++
# Clean tex compile
#++++++++++++++++++
clean_tex(){ latexmk -pdf $1; latexmk -c }
