xrandr --output DVI-D-1 --mode 1920x1080 --rate 144&
polybar bar2&
#xwinwrap -ov -g 1920x1080+0+0 -- mpv -wid WID ~/.gifs/usable/wall.mp4 --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-input-default-bindings --hwdec --log-file=/home/prashant/.mpvlog.log&
feh --bg-fill ~/.wp2.jpg&
compton --config /home/prashant/.compton.conf&
mopidy&
redshift -l -35.3:149&
xrdb ~/.Xresources
dunst&
xsetroot -cursor_name left_ptr&
xsetwacom set 9 Area 2500 2500 7500 7500&
2bwm
