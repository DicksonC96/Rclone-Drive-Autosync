#!/bin/bash
if pidof -o %PPID -x “rclone-cron.sh”; then
exit 1
fi
rclone sync gdrive: --exclude /adobe/* onedrive: --exclude /adobe/* -vP --use-mmap --log-file /home/dicksonchiang96/log/sync_$(date '+%Y%m%d%H%M').log
exit
