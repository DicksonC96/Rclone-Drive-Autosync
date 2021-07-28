#!/bin/bash
if pidof -o %PPID -x “rclone-check-cron.sh”; then
exit 1
fi
logfile="/home/dicksonchiang96/log/check_sync.log"
rclone check onedrive:_backup gdrive:_backup --exclude /adobe/* --log-file $logfile || {
	missing=$(cat $logfile | grep -oE "[0-9]+ differences" | tail -1 | grep -oE "[0-9]+")
	rm $logfile
	./script/telegram_notify_sync.py $missing
} 
exit
