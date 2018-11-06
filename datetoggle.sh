if xwininfo -all -id $(xdotool search --class 'polybar') | grep -q IsUnMapped; then
	xdo show -N "Polybar"
else
	xdo hide -N "Polybar"
fi
