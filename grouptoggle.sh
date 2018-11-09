waitron group_toggle $1
k=$(bash ~/.scripts/numtoword.sh $1)
dunstify -r 1 $k
