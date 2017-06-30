#! /bin/sh
#ezfetch - the lightest and simplest *fetch out there.
#oh- and look how easy it is to configure!
#created by LonelyPyxel and modified by camonater62
#vars
HOST="$(hostname)"
KERNEL="$(uname -mrs)"
SHELL="$(ls -l /proc/$$/exe | sed 's%.*/%%')"
    if [ -n "$DISPLAY" ]; then #Credit to Mitya on IRC for this func.
	id="$(xprop -root -notype | \awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}')" 
	wm="$(xprop -id "$id" -notype -f _NET_WM_NAME 8t)"
	wm="${wm/*_NET_WM_NAME = }"
	wm="${wm/\"}"
	wm="${wm/\"*}"
    fi
#source: https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script
OS=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VERSION=$(awk '/DISTRIB_RELEASE=/' /etc/*-release | sed 's/DISTRIB_RELEASE=//' | sed 's/[.]0/./')

if [ -z "$OS" ]; then
    OS=$(awk '{print $1}' /etc/*-release | tr '[:upper:]' '[:lower:]')
fi

if [ -z "$VERSION" ]; then
    VERSION=$(awk '{print $3}' /etc/*-release)
fi

#Check DE
if [ "$XDG_CURRENT_DESKTOP" = "" ]
then
  desktop=$(echo "$XDG_DATA_DIRS" | sed 's/.*\(xfce\|kde\|gnome\).*/\1/')
else
  desktop=$XDG_CURRENT_DESKTOP
fi

desktop=${desktop,,}  # convert to lower case

NC='\e[0m' # No Color

echo -e " E \033[1;37m██\033[0;30m██ ${NC}Distro:         $OS
 Z \033[0;34m██\033[1;34m██ ${NC}Bit:            $ARCH
 F \033[0;32m██\033[1;32m██ ${NC}Release:        $VERSION
 E \033[0;36m██\033[1;36m██ ${NC}Kernel:         $KERNEL
 T \033[0;31m██\033[1;31m██ ${NC}Host:           $HOST
 C \033[0;35m██\033[1;35m██ ${NC}WM:             $wm
 H \033[0;33m██\033[1;33m██ ${NC}Shell:          $SHELL
1.4\033[1;30m██\033[0;37m██ ${NC}DE:             $desktop"
