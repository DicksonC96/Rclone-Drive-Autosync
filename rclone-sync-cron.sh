#!/bin/bash
if pidof -o %PPID -x “rclone-sync-cron.sh”; then
exit 1
fi

logfile=/home/ubuntu/log/sync_$(date +%Y%m%d).log
rclone sync gdrive: --exclude /adobe/* onedrive: --exclude /adobe/* -vP --use-mmap --log-file $logfile
if [[ $(cat $logfile | grep -v ..:..:.. | tail -1 | grep Response) ]];
then
signal=error
elif [[ $(cat $logfile | grep -v ..:..:.. | tail -5 | grep "Deleted:") ]]
then
signal=synced
elif [[ $(cat $logfile | grep -v ..:..:.. | tail -5 | grep "0 / 0 Byte") ]]
then
exit
else
signal=synced
fi

./script/telegram_sync_result.py $signal $logfile

exit
