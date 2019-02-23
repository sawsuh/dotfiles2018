tdrop -a -w 800 -h 400 -x 20 -y 680 -n 2 -f "-name music -title music -e ncmpcpp" urxvt
k=$(xdotool search --classname "music")
hex=$(printf '%x\n' $k)
if wmctrl -l | grep $hex; then
	xdotool windowraise $k  
	xdotool mousemove 50 800
	sleep 0.1	
	xdotool key "Super+j"
fi
