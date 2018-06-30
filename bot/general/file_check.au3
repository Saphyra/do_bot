Func checkFiles()
   writeLog("Checking files...", $LEVEL_INFO)

   local $ini = IniReadSection($FILES_INI_PATH, "files")
   local $i
   For $i = 1 To UBound($ini) - 1
	  local $fileName = $ini[$i][1]
	  writeLog("Checking " & $fileName, $LEVEL_DEBUG)

	  If Not FileExists($fileName) Then
		 writeLog($fileName & " not found", $LEVEL_ERROR)
		 MsgBox(0, "File not found.", $fileName & " not found.")
		 Close()
	  EndIf
   Next
EndFunc