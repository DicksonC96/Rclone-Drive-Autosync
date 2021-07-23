synctrigger = "C:\synctrigger.txt"
Set oFSO = CreateObject("Scripting.Filesystemobject")
If not oFSO.FileExists(synctrigger) Then
    oFSO.CreateTextFile(synctrigger)
End If