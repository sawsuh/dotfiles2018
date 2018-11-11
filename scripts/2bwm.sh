
#!/bin/bash
CURRENT="+"
BACKGROUND="-"
cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'` > /dev/null
tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'` > /dev/null
cur=$(($cur + 1)) 
for ((i = 1; i <= $tot; i++)); do
	if [ "$i" = "$cur" ]
	then
		k=$(( $i - 1 ))
		echo -n "$(bash ~/.scripts/numtoword.sh $k)"
	fi
done
