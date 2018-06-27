Func close()
   Exit
EndFunc

Func getFilePath($name)
   return IniRead("data/files.ini", "files", $name, 0)
EndFunc

Func getTimeStamp()
   return @HOUR * 3600 + @MIN * 60 + @SEC
EndFunc