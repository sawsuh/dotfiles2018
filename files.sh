xcord=$(xdotool getmouselocation --shell | awk -F '=' '{print $2; exit}')
if [[ "$xcord" > 2560 ]]
then
	tdrop -a -h 600 -w 1200 -x 3902	 -y 822 -n 1 -f "-name stick1 -e ranger" urxvt	
else
	tdrop -a -h 600 -w 1200 -x 1342 -y 822 -n 1 -f "-name stick1 -e ranger" urxvt
fi 
