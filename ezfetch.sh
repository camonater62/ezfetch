#! /bin/sh
#ezfetch - the lightest and simplest *fetch out there.
#oh- and look how easy it is to configure!
#created by LonelyPyxel and modified by camonater62
#vars
HOST="$(hostname)"
KERNEL="$(uname -mrs)"
OS="$(lsb_release -d)"
SHELL="$(echo $SHELL)"
    if [ -n "$DISPLAY" ]; then #Credit to Mitya on IRC for this func.
	id="$(xprop -root -notype | \awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}')" 
	wm="$(xprop -id "$id" -notype -f _NET_WM_NAME 8t)"
	wm="${wm/*_NET_WM_NAME = }"
	wm="${wm/\"}"
	wm="${wm/\"*}"
    fi
#output p1

echo -e "   ██████  ██████
   ██      ██
   ████    ████
   ██      ██
   ██████  ██
$OS
Kernel:         $KERNEL
Host:           $HOST
WM:             $wm
Shell:          $SHELL"
echo -e "--ezfetch v1.2-- \e[0m"
