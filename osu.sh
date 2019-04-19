
#!/bin/bash
pavucontrol&
xrandr --output HDMI-1 --off
xsetwacom set 9 MapToOutpot 1920x1080+0+0
cd ~/.osu && dotnet run --project osu.Desktop -c Release
pkill pavucontrol
xrandr --output DVI-I-1 --off --output HDMI-1 --mode 2560x1440 --pos 1920x0 1x1 --output DP-1 --off --output DVI-D-1 --primary --mode 1920x1080 --rate 144
xsetwacom set 9 MapToOutpot 1920x1080+0+0

