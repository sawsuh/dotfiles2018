tdrop -a -h 400 -w 800 -x 1100 -y 680 -n 1 -f "-name files -e ranger" urxvt
k=$(xdotool search --classname "files")
hex=$(printf '%x\n' $k)
if wmctrl -l | grep $hex; then
	xdotool windowraise $k 
	xdotool mousemove 1200 800
	sleep 0.1
	xdotool key "Super+j"
fi
