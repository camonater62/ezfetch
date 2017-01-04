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

#output
echo "
ezfetch v1.1
-------------------------
$OS
Kernel:         $KERNEL
Hostname:       $HOST
Window Manager: $wm
Shell:          $SHELL"
if [ -e "/etc/manjaro-release" ] 
then
	echo -e "\e[32m
██████████████  ██████
██████████████  ██████
██████████████  ██████
██████		██████
██████  ██████  ██████
██████  ██████  ██████
	██████  ██████
██████  ██████  ██████
██████  ██████  ██████
██████  ██████  ██████
██████  ██████  ██████
	"
else
	echo -e "\e[0;31m
\e[0;31m██████\e[0;35m No Logo Has Been Added
\e[0;31m██  ██\e[0;35m For This Distro Yet
\e[0;31m██████\e[0;35m ;(
	"
fi

echo -e "\e[0m"
