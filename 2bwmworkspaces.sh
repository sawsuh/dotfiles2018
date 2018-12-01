
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
        0) echo -n "ten" ;;
        1) echo -n "one" ;;
        2) echo -n "two" ;;
        3) echo -n "three" ;;
        4) echo -n "four" ;;
        5) echo -n "five" ;;
        6) echo -n "six" ;;
        7) echo -n "seven" ;;
        8) echo -n "eight" ;;
        9) echo -n "nine" ;;
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

