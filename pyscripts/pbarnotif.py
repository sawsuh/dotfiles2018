from barclass import bar
import sys

left = bar("pop1", "DVI-D-1")
right = bar("pop2", "HDMI-A-0")

if sys.argv[1] == "1":
    currentbar = left
    otherbar = right
elif sys.argv[1] == "2":
    currentbar = right
    otherbar = left

if currentbar.barpid():
    if currentbar.barvisible():
        currentbar.barunmap()
    else:
        currentbar.barmap()
        otherbar.barunmap()
else:
    currentbar.barspawn()
    otherbar.barunmap()
