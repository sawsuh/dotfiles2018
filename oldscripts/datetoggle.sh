if xwininfo -all -id $(xdotool search --class 'polybar') | grep -q IsUnMapped; then
	xdo show -N "Polybar"
#	xdo raise -N "Polybar"
else
	xdo hide -N "Polybar"
fi
if ! pgrep "polybar" > /dev/null
then
	polybar main > /dev/null
fi
