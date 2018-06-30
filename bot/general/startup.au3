Global Const $FILES_INI_PATH = "data/files.ini"

Func startUp()
   writeLog("StartUp checks started...", $LEVEL_INFO)
   checkFiles()
   deleteLogFiles()
EndFunc

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

Func deleteLogFiles()
   If IniRead($SETTINGS_INI_FILE, "log", "delete_upon_start", $GUI_CHECKED) = $GUI_CHECKED Then
	  writeLog("Deleting log files...", $LEVEL_INFO)


	  local $debugFile = getFileOfLevel($LEVEL_DEBUG)
	  If FileExists($debugFile) Then
		 FileDelete($debugFile)
	  EndIf

	  local $infoFIle = getFileOfLevel($LEVEL_INFO)
	  If FileExists($infoFIle) Then
		 FileDelete($infoFIle)
	  EndIf

	  local $warnFile = getFileOfLevel($LEVEL_WARN)
	  If FileExists($warnFile) Then
		 FileDelete($warnFile)
	  EndIf

	  local $errorFile = getFileOfLevel($LEVEL_ERROR)
	  If FileExists($errorFile) Then
		 FileDelete($errorFile)
	  EndIf
   Else
	  writeLog("Deleting log files upon startup is turned off.", $LEVEL_WARN)
   EndIf
EndFunc