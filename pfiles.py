import re
import subprocess as sp
mouseloc = sp.run(['xdotool','getmouselocation','--shell'], stdout = sp.PIPE)
xcoord = re.findall(r"X=[0-9]{4}",mouseloc.stdout.decode('utf-8'))[0][2:]
command = ['bash','/home/prashant/.files.sh']
if int(xcoord) > 2560:
    command.append('3902')
    sp.Popen(command, stderr=sp.DEVNULL, stdout=sp.DEVNULL)
else:
    command.append('1342')
    sp.Popen(command, stderr=sp.DEVNULL, stdout=sp.DEVNULL)
