tdrop -a -h 309 -w 721 -x 1179 -y 751 -n 1 -f "-name files -e ranger" urxvt
k=$(xdotool search --classname "files")
xdotool windowraise $k
xdotool windowfocus $k
