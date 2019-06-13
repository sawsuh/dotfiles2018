xcord=$(xdotool getmouselocation --shell | awk -F '=' '{print $2; exit}')
if [[ "$xcord" > 1920 ]]
then
	tdrop -a -h 500 -w 1000 -x 3464 -y 924 -n 1 -f "-name stick1 -e ranger" urxvt	
else
	tdrop -a -h 450 -w 884 -x 1020 -y 614 -n 1 -f "-name stick1 -e ranger" urxvt
fi 
