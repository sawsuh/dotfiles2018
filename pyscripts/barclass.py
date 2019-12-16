import subprocess as sp
import re


class bar:
    def __init__(self, name, monitor):
        self.name = name
        self.monitor = monitor

    def barpid(self):
        pgrep = sp.run(["pgrep", "-a", "polybar"],
                       stdout=sp.PIPE)  # grep polybar pids
        processes = pgrep.stdout.decode("utf-8")  # get output
        matchstring = re.compile(f"([0-9]+).+{str(self.name)}")
        if matchstring.search(processes):
            barline = matchstring.search(processes).group(
                1
            )  # find line corresponding to our bar
            return barline  # get pid

    def barvisible(self):
        if not self.barpid():
            return False
        cmd = ["xdotool", "search", "--pid",
               str(self.barpid()), "--onlyvisible"]
        output = sp.run(cmd, stdout=sp.PIPE)  # check vis
        return output.stdout.decode("utf-8")  # return wid if exists

    def barunmap(self):
        if not self.barpid():
            return False
        sp.run(["polybar-msg", "-p", self.barpid(), "cmd", "hide"])
        sp.run(["bspc", "config", "-m", str(self.monitor), "bottom_padding", "10"])

    def barmap(self):
        if not self.barpid():
            return False
        sp.run(["bspc", "config", "-m", str(self.monitor), "bottom_padding", "80"])
        sp.run(["polybar-msg", "-p", self.barpid(), "cmd", "show"])

    def barspawn(self):
        sp.run(["bspc", "config", "-m", str(self.monitor), "bottom_padding", "80"])
        sp.Popen(["polybar", str(self.name)])
