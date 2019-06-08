import time
import sys

study = 25
smallbreak = 5
bigbreak = 25
smallcount = 4

while 1 == 1:
    scounter = 0
    while scounter < smallcount+1:
        timecounter = 0
        tleft = study - timecounter
        sys.stdout.write("\r\x1b[K"+"work - %dm left" % tleft)
        sys.stdout.flush()
        while timecounter < study+1:
            tleft = study - timecounter
            sys.stdout.write("\r\x1b[K"+"work - %dm left" % tleft)
            sys.stdout.flush()
            time.sleep(60)
            timecounter += 1
        if scounter < smallcount:
            sys.stdout.write("\r\x1b[K"+"small break")
            sys.stdout.flush()
            time.sleep(smallbreak*60)
        scounter += 1
    sys.stdout.write("\r\x1b[K"+"big break")
    sys.stdout.flush()
    time.sleep(bigbreak*60)
