def color(hexstring):
    hexlist = [hexstring[i:i+2] for i in range(0,6,2)]
    red = round(int(hexlist[0],16)*6/255)
    green = round(int(hexlist[1],16)*6/255)
    blue = round(int(hexlist[2],16)*6/255)
    print(red)
    print(green)
    print(blue)
colorcode = input("")
color(colorcode)
