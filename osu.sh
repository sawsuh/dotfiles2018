
#!/bin/bash
pavucontrol&
xrandr --output HDMI-1 --off
xsetwacom set 9 MapToOutpot 1920x1080+0+0
cd ~/.osu && dotnet run --project osu.Desktop -c Release
pkill pavucontrol
xrandr --output HDMI-1 --right-of DVI-D-1 --mode 2560x1440 --pos 1920x0 --rotate normal --output DVI-D-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --rate 144
xsetwacom set 9 MapToOutpot 1920x1080+0+0

