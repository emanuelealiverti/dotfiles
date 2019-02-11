#!/bin/bash



### Script to backup dot files and config


### remove files whose size is greater than this kb (1100 ~ 1Mb)
SIZE_MAX=1100
DATE=`date +%Y%m%d`

fol='/home/meme/MEGA/000_Documents_personal/backup/'$DATE

mkdir $fol
mkdir $fol/dot
mkdir $fol/dot/zsh
mkdir $fol/config
mkdir $fol/bin
mkdir $fol/grubthemes
mkdir $fol/ssh

cd /home/meme/

# copy dot file and append dot to the name
for f in .*; do cp -v -- "$f" "$fol/dot/dot$f"; done   
cp -r .oh-my-zsh/completions $fol/dot/zsh/. 

cd /home/meme/.config
cp -r /home/meme/.config/* $fol/config/.
cp -r /home/meme/bin/* $fol/bin/.
## grub themes
cp -r /boot/grub/themes/* $fol/grubthemes/.
cp -r /home/meme/.ssh/* $fol/ssh/.

## delete files bigger than SIZE_MAX (makes sense since I want to backup small scripts and config)

du -s $fol/config/* | while read size filename; do if [ $size -gt $SIZE_MAX ]; then rm -rf $filename; fi; done
du -s $fol/dot/* | while read size filename; do if [ $size -gt $SIZE_MAX ]; then rm -rf $filename; fi; done
du -s $fol/bin/* | while read size filename; do if [ $size -gt $SIZE_MAX ]; then rm -rf $filename; fi; done

#Remove annoying files
declare -a bad=(
"dot.zsh_history"
"dot.julia_history"
"dot.ICEauthority"
"dot.zcompdump-meme-XPS9560-5.1.1"
"dot.zcompdump"
"hexchat"
"evolution"
"transmission"
"inkspace"
"evolution"
"matplotlib"
"mcomix"
"Mendeley Ltd."
"Popcorn-Time"
"RStudio"
"skypeforlinux"
"Soundnode"
"tilda"
"transmission"
"transmission-daemon"
"VirtualBox"
"vlc"
"yad.conf"
"yelp"
"inkscape"
)

for i in "${bad[@]}"
do
	rm -rf $fol/dot/$i
	rm -rf $fol/config/$i
done


#zip everything, move back and remove working directoy
cd $fol
zip -r ../$DATE.zip *
cd ../
rm -rf $DATE/


#restart megasync
#killall megasync
#sleep 1 
#megasync &

#restart megasync
killall mega-cmd-server
sleep 1 
mega-sync && exit

###crontab

## crontab -e

#+---------------- minute (0 - 59)
#|  +------------- hour (0 - 23)
#|  |  +---------- day of month (1 - 31)
#|  |  |  +------- month (1 - 12)
#|  |  |  |  +---- day of week (0 - 7) (Sunday=0 or 7)
#|  |  |  |  |
	#*  *  *  *  *  command to be executed
#-------------------------------------------------------------------------
#0 11 * * 1 DISPLAY=:0 this_file.sh

## DISPLAY is necessary since megasync requires a GUI. Everything works regardless BUT the last line (restart mega)
#done

