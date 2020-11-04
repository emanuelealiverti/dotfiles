#!/bin/bash

# Requires rclone to be set up and create a clone driveVE and rclonesync [https://github.com/cjnaz/rclonesync-V2 ]

RC_PATH=/home/meme/GIT/rclonesync-V2/rclonesync
GD_FOLD=/home/meme/VE_GDrive

main() {
	case "$1" in
		-run) 
			$RC_PATH $GD_FOLD driveVE:  -c --filters-file /home/meme/.rclonesyncwd/Filters -vv  --rclone-args --drive-skip-gdocs >> /tmp/gdrive_runlogVE 2>&1
			;;
		-reset)
			$RC_PATH $GD_FOLD driveVE: --first-sync -c --rclone-args --drive-skip-gdocs
			;;

		*) echo "Specify options" ;;
	esac
}


main "$@"; 
