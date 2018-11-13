
#!/bin/bash 
while true; do
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'` > /dev/null 
	echo "$(bash ~/.scripts/numtoword.sh $cur)" 
	sleep 0.2
done
