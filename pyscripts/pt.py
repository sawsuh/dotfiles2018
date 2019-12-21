import subprocess as sp
import time

recordcmd = [
    "slop",
    "-t",
    "0",
    "-b",
    "0",
    "-c",
    "0.9296875,0.890625,0.89453125,0.5",
    "-l",
    "-f",
    "%w %h %x %y",
    "--nokeyboard",
]
recording = sp.run(recordcmd, stdout=sp.PIPE, stderr=sp.DEVNULL)
width, height, topx, topy = recording.stdout.decode("utf-8").split(" ")
width = int(width) - 8
height = int(height) - 8

sp.Popen(["urxvt", "-name", "float"])
time.sleep(0.150)

widcommand = sp.run(["xdotool", "getwindowfocus"],
                    stdout=sp.PIPE, stderr=sp.DEVNULL)
wid = hex(int(widcommand.stdout.decode("utf-8")))
geomstring = f"0,{topx},{topy},{width},{height}"
sp.run(["wmctrl", "-i", "-r", wid, "-e", geomstring])
middlex = topx + width / 2
middley = topy + height / 2
sp.run(["xdotool", "mousemove", str(middlex), str(middley)])
sp.run(["xdotool", "windowactivate", wid])
