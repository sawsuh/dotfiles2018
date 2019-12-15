function tdropfunc {
	tdrop -a -h 600 -w 1200 -x $1 -y $2 -n 1 -f "-name stick1 -e ranger" urxvt
}

function bartest {	
	pid=$(pgrep -a polybar | grep $1 | awk '{print $1}')
	xdotool search --pid $pid --onlyvisible
}

xcord=$(xdotool getmouselocation --shell | awk -F '=' '{print $2; exit}')
if [[ "$xcord" > 2560 ]]
then 
	wid=$(bartest pop2)
	if [[ "$wid" != "" ]]
	then
		tdropfunc 3902 752
	else
		tdropfunc 3902 822
	fi
else
	wid=$(bartest pop1)
	if [[ "$wid" != "" ]]
	then
		tdropfunc 1342 752
	else
		tdropfunc 1342 822
	fi
fi 
