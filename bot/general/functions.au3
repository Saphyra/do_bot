Func Close()
   Exit
EndFunc

Func getFilePath($name)
   return IniRead("data/files.ini", "files", $name, 0)
EndFunc