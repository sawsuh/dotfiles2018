import subprocess as sp
import re
import sys

class bar:
    def __init__(self, name, monitor):
        self.name = name
        self.monitor = monitor
	
    def barpid(self):
        cmd = ['pgrep', '-a', 'polybar']
        pgrep = sp.run(cmd, stdout=sp.PIPE) #grep polybar pids
        processes = pgrep.stdout.decode('utf-8') # get output
        matchstring = "[0-9]+.+"+str(self.name)
        if re.search(matchstring, processes):
            barline = re.search(matchstring ,processes).group(0) #find line corresponding to our bar
            return(barline.split(' ')[0]) #get pid
	
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
        sp.run(['bspc', 'config', '-m', str(self.monitor), 'bottom_padding', '10'],stdout=sp.PIPE)

    def barmap(self):
        sp.run(['bspc', 'config', '-m', str(self.monitor), 'bottom_padding', '80'],stdout=sp.PIPE)
        sp.run(['xdotool', 'windowmap', str(self.barwidinvisible())],stderr = sp.DEVNULL, stdout=sp.DEVNULL)

    def barspawn(self):
        sp.run(['bspc', 'config', '-m', str(self.monitor), 'bottom_padding', '80'],stdout=sp.PIPE)
        sp.Popen(['polybar', str(self.name)], stderr = sp.DEVNULL,stdout=sp.DEVNULL)

monitorone = 'DVI-D-1'
monitortwo = 'HDMI-A-0'
left = bar('pop1', 'DVI-D-1')
right = bar('pop2', 'HDMI-A-0')
if sys.argv[1] == '1':
    if left.barpid() is not None:
        if left.barwidvisible() != "":
            left.barunmap()
        else:
            left.barmap()
            right.barunmap()
    else:
        left.barspawn()
        right.barunmap()
elif sys.argv[1] == '2':    
    if right.barpid() is not None: 
        if right.barwidvisible() != "":
            right.barunmap()
        else:
            right.barmap()
            left.barunmap()
    else:
        right.barspawn()
        left.barunmap()
