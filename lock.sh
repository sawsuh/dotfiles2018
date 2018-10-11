#!/usr/bin/env bash

scrot /home/prashant/.screen.png
icon="/$HOME/.lock.png"
tmpbg="$HOME/.screen.png"

#(( $# )) && { icon=$1; }
#convert "$tmpbg" -colorspace Gray "$tmpbg"
convert "$tmpbg" -brightness-contrast -40x0 "$tmpbg"
convert "$tmpbg" -scale 20% -scale 500% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock 
rm "$tmpbg"
