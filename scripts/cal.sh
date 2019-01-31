k=$(xdotool search --classname "cal")
hex=$(printf '%x\n' $k)
echo $hex
if [ $hex == "0" ]; then
	urxvt -g 20x9 -name cal -hold -e zsh -c cal& 
	sleep 0.1
	xdotool key "Super+j"
	j=$(xdotool search --classname "cal")
else
	echo $k
	xkill -id $k;
fi


