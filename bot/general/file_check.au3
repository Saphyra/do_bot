Func checkFiles()
   local $ini = IniReadSection($FILES_INI_PATH, "files")
   local $i
   For $i = 1 To UBound($ini) - 1
	  If Not FileExists($ini[$i][1]) Then
		 MsgBox(0, "File not found.", $ini[$i][1] & " not found.", 5)
		 Close()
	  EndIf
   Next
EndFunc