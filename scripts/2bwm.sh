
#!/bin/bash 

numtoword(){
n=$1 
len=$(echo $n | wc -c)
len=$(( $len - 1 ))
 
#echo "Your number $n in words : "
for (( i=1; i<=$len; i++ ))
do
   # get one digit at a time
    digit=$(echo $n | cut -c $i)
   # use case control structure to find digit equivalent in words 
    case $digit in
        9) echo -n "ten" ;;
        0) echo -n "one" ;;
        1) echo -n "two" ;;
        2) echo -n "three" ;;
        3) echo -n "four" ;;
        4) echo -n "five" ;;
        5) echo -n "six" ;;
        6) echo -n "seven" ;;
        7) echo -n "eight" ;;
        8) echo -n "nine" ;;
    esac 
done
}

# just print new line
echo ""


while true; do
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'` > /dev/null 
	echo "$(numtoword $cur)" 
	sleep 0.2
done

