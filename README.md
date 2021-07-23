# Rclone-Drive-Autosync
The scripts present in this repo functions to automate the sync between virtual storage system using Rclone.
** Rclone must be initialized on your linux machine/ windows machine to work
** This is not meant to provide a concise or verbose tutorial for how to automate rclone syncing or rclone checking.

## On virtual Linux machine (Running on GCP to check if the drives require synchronization)
rclone-cron.sh : Bash script to run an rclone check. If yes, run telegram_notify_sync.py to send notification.
telegram_notify_sync.py : Python script to send notification to a telegram bot with the number of unsynced file(s) parsed from rclone log.
Crontab setting : Run "crontab -e" to set the crontab. Schedule to run rclone-cron.sh at desired frequency.

## On local Windows workstation (Automate rclone sync everyday using task scheduler)
Run Rclone sync command at specific time daily or whenever the workstation is in idle state.
Trigger file must be present for the sync to occur.
create-file.vbs : VBS script to create the trigger file.
toggle-file.vbs : VBS script to create the trigger when it's not present, or delete it when it's present.
rclone-prompt.cmd : Batch script to check the presence of trigger file, run rclone sync if yes. AutomProvide simple GUI to skip the sync.
rclone-forcedsync.cmd : Batch script to force run an rclone sync whether or not the trigger is present.
Task scheduler setting: Set create-file.vbs to run on a daily basis. Set rclone-prompt.cmd to run daily or when idle.