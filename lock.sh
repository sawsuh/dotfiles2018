#!/usr/bin/env bash

scrot /home/prashant/screen.png
icon="/$HOME/lock.png"
tmpbg="$HOME/screen.png"

(( $# )) && { icon=$1; }

convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
rm "$tmpbg"
