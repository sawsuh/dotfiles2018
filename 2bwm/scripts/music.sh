tdrop -a -h 309 -w 721 -x 10 -y 751 -n 2 -f "-name music -title music -e ncmpcpp" urxvt
k=$(xdotool search --classname "music")
hex=$(printf '%x\n' $k)
if wmctrl -l | grep $hex; then
	xdotool windowraise $k  
	xdotool mousemove 50 800
	sleep 0.1
	xdotool key "Super+f"
	xdotool key "Super+t"
fi
