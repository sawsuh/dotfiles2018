import subprocess as sp
import re
import sys

def barpid(barname):
    cmd = ['pgrep', '-a', 'polybar']
    pgrep = sp.run(cmd, stdout=sp.PIPE) #grep polybar pids
    processes = pgrep.stdout.decode('utf-8') # get output
    matchstring = "[0-9]+.+"+str(barname)
    if re.search(matchstring, processes):
        barline = re.search(matchstring ,processes).group(0) #find line corresponding to our bar
        return(barline.split(' ')[0]) #get pid
	
def barwidvisible(pid): 
    cmd = ['xdotool', 'search', '--pid', str(pid), '--onlyvisible'] 
    output = sp.run(cmd,stderr = sp.DEVNULL, stdout=sp.PIPE) #check vis
    return(output.stdout.decode('utf-8')) #return wid if exists 
	
def barwidinvisible(pid): 
    cmd = ['xdotool', 'search', '--pid', str(pid)] 
    output = sp.run(cmd,stderr = sp.DEVNULL, stdout=sp.PIPE) #check wid
    return(output.stdout.decode('utf-8')) #return wid if exists 
    
def barunmap(wid, monitor):
    sp.run(['xdotool', 'windowunmap', str(wid)],stderr = sp.DEVNULL,stdout=sp.DEVNULL)
    sp.run(['bspc', 'config', '-m', str(monitor), 'bottom_padding', '10'],stdout=sp.PIPE)

def barmap(wid,monitor):
    sp.run(['bspc', 'config', '-m', str(monitor), 'bottom_padding', '80'],stdout=sp.PIPE)
    sp.run(['xdotool', 'windowmap', str(wid)],stderr = sp.DEVNULL, stdout=sp.DEVNULL)

def barspawn(barname, monitor):
    sp.run(['bspc', 'config', '-m', str(monitor), 'bottom_padding', '80'],stdout=sp.PIPE)
    sp.Popen(['polybar', str(barname)], stderr = sp.DEVNULL,stdout=sp.DEVNULL)

monitorone = 'DVI-D-1'
monitortwo = 'HDMI-A-0'

if sys.argv[1] == '1':
    if barpid('pop1') is not None:
        wid = barwidvisible(barpid('pop1'))
        if wid != "":
            barunmap(wid, monitorone)
        else:
            wid = barwidinvisible(barpid('pop1'))
            barmap(wid, monitorone)
            barunmap(barwidinvisible(barpid('pop2')), monitortwo)
    else:
        barspawn('pop1', monitorone)
        barunmap(barwidinvisible(barpid('pop2')), monitortwo)
elif sys.argv[1] == '2':    
    if barpid('pop2') is not None:
        wid = barwidvisible(barpid('pop2'))
        if wid != "":
            barunmap(wid, monitortwo)
        else:
            wid = barwidinvisible(barpid('pop2'))
            barmap(wid, monitortwo)
            barunmap(barwidinvisible(barpid('pop1')), monitorone)
    else:
        barspawn('pop2', monitortwo)
        barunmap(barwidinvisible(barpid('pop1')), monitorone)
