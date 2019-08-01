xcord=$(xdotool getmouselocation --shell | awk -F '=' '{print $2; exit}')
if [[ "$xcord" > 2560 ]]
then
	tdrop -a -h 500 -w 1000 -x 4104 -y 924 -n 1 -f "-name stick1 -e ranger" urxvt	
else
	tdrop -a -h 500 -w 1000 -x 1544 -y 924 -n 1 -f "-name stick1 -e ranger" urxvt
fi 
