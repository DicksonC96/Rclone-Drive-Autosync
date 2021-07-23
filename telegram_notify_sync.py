#!/usr/bin/env python3

import requests
from datetime import datetime
import sys

missing = sys.argv[1]
token = "??"
url = f"https://api.telegram.org/bot{token}"
params = {"chat_id": "??", "text": "Sync now! {} file(s) pending.\nYour OneDrive requires sync with Google Drive.\nLast checked: {}".format(str(missing), str(datetime.today())[:-7])}
requests.get(url + "/sendMessage", params=params)
