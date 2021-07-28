@ECHO OFF
TITLE RClone Sync Prompt
ECHO.
ECHO.
ECHO Sync your Google Drive with OneDrive now?
CHOICE /T 5 /C YN /D Y
set _e=%ERRORLEVEL%
IF /i %_e% == 1 GOTO yes
IF /i %_e% == 2 GOTO no
GOTO end
:yes
SET logdir=C:\Rclone\sync_log\sync_%date:~10,4%%date:~4,2%%date:~7,2%.log
@ECHO ON
C:\Rclone\rclone.exe sync gdrive: --exclude /adobe/* onedrive: --exclude /adobe/* -vP --use-mmap --log-file %logdir%
@ECHO OFF
ECHO.
ECHO Rclone sync completed. Log saved at %logdir%
IF exist C:\Rclone\synctrigger.txt (
DEL C:\Rclone\synctrigger.txt 
ECHO I'm done for today! Next sync scheduled tomorrow.
) ELSE (
ECHO I had synced more than once today. Give me a break!
)
ECHO.
ECHO Shut down will be initiated in 10 seconds.
TIMEOUT 10
GOTO end
:no
ECHO.
ECHO Your sync has been cancelled without leaving any traces.
TIMEOUT 5
:end
shutdown -s