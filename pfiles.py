import subprocess as sp
import re

def files(x,y): 
    cmd = [ 'tdrop', '-a', '-h', '600', '-w', '1200', '-x', str(x), '-y', str(y), '-n', '1', '-f', "-name stick1 -e ranger", 'urxvt' ]
    sp.run(cmd) #tdrop command

def barpid(popx):
    cmd = ['pgrep', '-a', 'polybar']
    pgrep = sp.run(cmd, stdout=sp.PIPE) #grep polybar pids
    processes = pgrep.stdout.decode('utf-8') # get output
    if re.search("[0-9]+.+"+str(popx),processes):  
        barline = re.search("[0-9]+.+"+str(popx),processes).group(0) #find line corresponding to our bar
        return(barline.split(' ')[0]) #get pid
    else: 
        return False

def visibilitytest(pid): 
    cmd = ['xdotool', 'search', '--pid', str(pid), '--onlyvisible'] 
    output = sp.run(cmd, stdout=sp.PIPE) #check vis
    return(output.stdout.decode('utf-8')) #return wid if exists

xcordin = sp.run(["xdotool", "getmouselocation", "--shell"], stdout=sp.PIPE) #get xdotool output
xcord = int(re.search("[0-9]+",str(xcordin.stdout.decode('utf-8'))).group(0)) #parse for mouse xcord

if xcord > 2560:
    if visibilitytest(barpid("pop2")):
        files(3902, 752)
    else:
        files(3902, 822)
else:
    if visibilitytest(barpid("pop1")):
        files(1342, 752)
    else:
        files(1342, 822) 
