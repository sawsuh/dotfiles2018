k=$(xdotool search --classname "cal")
hex=$(printf '%x\n' $k)
if [ $hex == "0" ]; then
	urxvt -g 20x10 -name cal -hold -e zsh -c 'cal && setterm -cursor off'& 
	sleep 0.1
	xdotool key "Super+j"
else
	xkill -id $k;
fi

