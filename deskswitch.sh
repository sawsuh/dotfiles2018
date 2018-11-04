bspc desktop -f '^'$1
num=$(bspc query --names -D -d '^'$1)
dunstify -r 1 $num
