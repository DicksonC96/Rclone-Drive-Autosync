@ECHO OFF
IF NOT exist C:\Rclone\synctrigger.txt GOTO end
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
DEL C:\Rclone\synctrigger.txt
ECHO Rclone sync completed. Log saved at %logdir%
ECHO I'm done for today! Next sync scheduled tomorrow.
ECHO.
PAUSE
GOTO end
:no
ECHO.
ECHO Sync will prompt again when idle or 12AM tomorrow.
TIMEOUT 5
:end