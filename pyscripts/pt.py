import subprocess as sp
import time

recordcmd = [
    "slop",
    "-t",
    "0",
    "-b",
    "5",
    "-c",
    "0.9296875,0.890625,0.89453125,1",
    "-f",
    "%w %h %x %y",
    "--nokeyboard",
]
recording = sp.run(recordcmd, stdout=sp.PIPE, stderr=sp.DEVNULL)
width, height, topx, topy = recording.stdout.decode("utf-8").split(" ")

sp.Popen(["urxvt", "-name", "float"])
time.sleep(0.100)

widcommand = sp.run(["xdotool", "getwindowfocus"],
                    stdout=sp.PIPE, stderr=sp.DEVNULL)
wid = hex(int(widcommand.stdout.decode("utf-8")))
geomstring = f"0,{topx},{topy},{width},{height}"
resizecmd = ["wmctrl", "-i", "-r", wid, "-e", geomstring]
sp.run(resizecmd)
