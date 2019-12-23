import datetime
import os
import shutil

os.chdir("/home/prashant/Downloads")
for file in os.listdir():
    modtime = datetime.datetime.fromtimestamp((os.path.getmtime(file)))
    timeago = datetime.datetime.now() - modtime
    daysago = int(timeago.days)
    if daysago > 7:
        if os.path.isfile(file):
            os.remove(file)
        else:
            shutil.rmtree(file)
        print(
            f'{file}, removed at {datetime.datetime.now().strftime("%d/%m/%Y")}, last modified {modtime.strftime("%d/%m/%Y")}'
        )
        continue
