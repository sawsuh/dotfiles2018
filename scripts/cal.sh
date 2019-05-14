k=$(xdotool search --classname "cal")
hex=$(printf '%x\n' $k)
if [ $hex == "0" ]; then
	urxvt -g 20x10+4144+949 -name cal -hold -e zsh -c 'cal && setterm -cursor off'& 
else
	xkill -id $k;
fi


