#!/bin/sh

# Generates zathura configuration file
mv zathurarc zathurarc_old

. $HOME/.cache/wal/colors.sh

main() {
	cat <<CONF
set recolor "false"
set recolor-lightcolor "$background"
set recolor-darkcolor "$foreground"

set completion-bg "$background"
set completion-fg "$foreground"
set completion-group-bg "$background"
set completion-group-fg "$color2"
set completion-highlight-bg "$foreground"
set completion-highlight-fg "$background"
set highlight-color "$color1"
set default-bg "$background"
set inputbar-bg "$background"
set inputbar-fg "$foreground"
set notification-bg "$background"
set notification-fg "$foreground"
set notification-error-bg "$color1"
set notification-error-fg "$foreground"
set notification-warning-bg "$color1"
set notification-warning-fg "$foreground"
set statusbar-bg "$background"
set statusbar-fg "$foreground"
set index-bg "$background"
set index-fg "$foreground"
set index-active-bg "$foreground"
set index-active-fg "$color1"
set selection-clipboard clipboard

set selection-clipboard clipboard
set guioptions "0" 
set highlight-transparency .2
set window-title-basename "false"
set window-icon /home/meme/bin/ICONS/document-24.png 
set statusbar-basename "false"
set selection-notification "false"
map [normal] i recolor
map [fullscreen] i recolor
map [presentation] i recolor
map [normal] b toggle_statusbar
CONF
}
main

main >> zathurarc
