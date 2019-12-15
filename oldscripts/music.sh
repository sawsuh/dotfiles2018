xcord=$(xdotool getmouselocation --shell | awk -F '=' '{print $2; exit}')
if [[ "$xcord" > 1920 ]]
then
	tdrop -a -h 500 -w 1000 -x 1930 -y 924 -n 2 -f "-name stick2 -e ncmpcpp" urxvt	
else
	tdrop -a -h 450 -w 884 -x 10 -y 614 -n 2 -f "-name stick2 -e ncmpcpp" urxvt
fi 
