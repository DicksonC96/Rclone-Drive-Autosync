synctrigger = "C:\synctrigger.txt"
Set oFSO = CreateObject("Scripting.Filesystemobject")
If oFSO.FileExists(synctrigger) Then
oFSO.DeleteFile(synctrigger)
sMsg = "The sync will rescheduled to tomorrow."
Else
    oFSO.CreateTextFile(synctrigger)
    sMsg = "The sync will start when idle."
End If
MsgBox sMsg, 64, "Rclone toggle"