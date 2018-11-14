tdrop -a -h 309 -w 721 -x 1179 -y 751 -n 1 -f "-name files -e ranger" urxvt
if wmctrl -l | grep ranger; then
	k=$(xdotool search --classname "files")
	xdotool windowraise $k
	xdotool windowfocus $k
	sleep 0.1
	xdotool mousemove 1200 800
	sleep 0.1
	xdotool key "Super+f"
	xdotool key "Super+t"
fi
