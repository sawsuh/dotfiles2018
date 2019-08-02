xcord=$(xdotool getmouselocation --shell | awk -F '=' '{print $2; exit}')
if [[ "$xcord" > 2560 ]]
then
	tdrop -a -h 600 -w 1200 -x 3904 -y 824 -n 1 -f "-name stick1 -e ranger" urxvt	
else
	tdrop -a -h 600 -w 1200 -x 1344 -y 824 -n 1 -f "-name stick1 -e ranger" urxvt
fi 
