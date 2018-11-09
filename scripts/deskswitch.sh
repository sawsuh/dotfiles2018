ws=$1
text=$(bash /home/prashant/.scripts/numtoword.sh $1)
dunstify -r 1 $text
