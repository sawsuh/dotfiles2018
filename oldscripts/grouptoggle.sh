if [ $2 = "show" ]; then
waitron group_activate $1
	k=$(bash ~/.scripts/numtoword.sh $1)
	dunstify -r 1 $k
else
	waitron group_deactivate $1
	k=$(bash ~/.scripts/numtoword.sh $1)
	dunstify -r 1 "$k hidden"
fi
