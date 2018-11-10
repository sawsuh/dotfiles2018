xrandr --output DVI-D-1 --mode 1920x1080 --rate 144&
xwinwrap -ov -g 1920x1080+0+0 -- mpv -wid WID ~/.gifs/H1.mp4 --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-input-default-bindings --hwdec --log-file=/home/prashant/.mpvlog.log&
compton --config /home/prashant/.compton.conf&
mopidy&
redshift -l -35.3:149&
xrdb ~/.Xresources
dunst&
xsetroot -cursor_name left_ptr&
exec xmonad
