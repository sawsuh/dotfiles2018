tdrop -a -h 309 -w 721 -x 10 -y 751 -n 1 -f "-name music -e ncmpcpp" urxvt
if wmctrl -l | grep ncmpcpp; then
	k=$(xdotool search --classname "music")
	xdotool windowraise $k
	xdotool windowfocus $k
	sleep 0.1
	xdotool mousemove 50 800
	sleep 0.1
	xdotool key "Super+f"
	xdotool key "Super+t"
fi
