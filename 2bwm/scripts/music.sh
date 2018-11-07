tdrop -a -h 309 -w 721 -x 10 -y 751 -n 2 -f "-name music -e ncmpcpp" urxvt
k=$(xdotool search --classname "music")
xdotool windowraise $k
xdotool windowfocus $k
#xdo raise -N "music"
