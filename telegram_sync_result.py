#!/usr/bin/env python3

import requests
from datetime import datetime
import sys
import re

signal = sys.argv[1]
logfile = sys.argv[2]

with open(logfile, "r") as file:
    log=file.readlines()

if signal == "error":
     message = "An error has occured with your sync.\nPlease check if this error is critical.\n\nError response:\n{}".format(log[-2:-1])
elif signal == "synced":
    messagelist=[" ".join(line.split()) for line in log[-8:-1] if not re.search(r"..:..:..", line)]
    messagelist.append("Last checked: " + str(datetime.today())[:-7])
    message = "Sync Done!\nYour One Drive had synced with Google Drive successfully.\n\nSync details:\n{}".format("\n".join(messagelist))

token = "??"
url = f"https://api.telegram.org/bot{token}"
params = {"chat_id": "??", "text": message}
requests.get(url + "/sendMessage", params=params)






