import subprocess as sp
import re
import sys

class bar:
    def __init__(self, name, monitor):
        self.name = name
        self.monitor = monitor
	
    def barpid(self):
        pgrep = sp.run(['pgrep', '-a', 'polybar'], stdout=sp.PIPE) #grep polybar pids
        processes = pgrep.stdout.decode('utf-8') # get output
        matchstring = re.compile("([0-9]+).+"+str(self.name))
        if matchstring.search(processes):
            barline = matchstring.search(processes).group(1) #find line corresponding to our bar
            return(barline) #get pid
	
    def barwidvisible(self): 
        cmd = ['xdotool', 'search', '--pid', str(self.barpid()), '--onlyvisible'] 
        output = sp.run(cmd,stderr = sp.DEVNULL, stdout=sp.PIPE) #check vis
        return(output.stdout.decode('utf-8')) #return wid if exists 
	
    def barwidinvisible(self): 
    	cmd = ['xdotool', 'search', '--pid', str(self.barpid())] 
    	output = sp.run(cmd,stderr = sp.DEVNULL, stdout=sp.PIPE) #check vis
    	return(output.stdout.decode('utf-8')) #return wid if exists  
    
    def barunmap(self):
        sp.run(['xdotool', 'windowunmap', str(self.barwidinvisible())],stderr = sp.DEVNULL,stdout=sp.DEVNULL)
        sp.run(['bspc', 'config', '-m', str(self.monitor), 'bottom_padding', '10'])

    def barmap(self):
        sp.run(['bspc', 'config', '-m', str(self.monitor), 'bottom_padding', '80'])
        sp.run(['xdotool', 'windowmap', str(self.barwidinvisible())],stderr = sp.DEVNULL, stdout=sp.DEVNULL)

    def barspawn(self):
        sp.run(['bspc', 'config', '-m', str(self.monitor), 'bottom_padding', '80'])
        sp.Popen(['polybar', str(self.name)], stderr = sp.DEVNULL,stdout=sp.DEVNULL)

left = bar('pop1', 'DVI-D-1')
right = bar('pop2', 'HDMI-A-0')

currentbar = bar('','')
otherbar = bar('','')
if sys.argv[1] == '1':
    currentbar = left
    otherbar = right
elif sys.argv[1] == '2':
    currentbar = right
    otherbar = left

if currentbar.barpid() is not None:
    if currentbar.barwidvisible():
        currentbar.barunmap()
    else:
        currentbar.barmap()
        otherbar.barunmap()
else:
    currentbar.barspawn()
    otherbar.barunmap()

