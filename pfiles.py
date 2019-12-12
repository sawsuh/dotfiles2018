import subprocess as sp
import re

def files(x,y): 
    sp.run([ 'tdrop', '-a', '-h', '600', '-w', '1200', '-x', str(x), '-y', str(y), '-n', '1', '-f', "-name stick1 -e ranger", 'urxvt' ])

def barpid(popx):
    pgrep = sp.run(['pgrep', '-a', 'polybar'], stdout=sp.PIPE) #grep polybar pids
    processes = pgrep.stdout.decode('utf-8') # get output
    matchstring = re.compile("([0-9]+).+"+str(popx))
    if matchstring.search(processes):  
        return( matchstring.search(processes).group(1)) #find line corresponding to our bar
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
