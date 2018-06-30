Global Const $LEVEL_DEBUG = "debug"
Global Const $LEVEL_INFO = "info"
Global Const $LEVEL_WARN = "warn"
Global Const $LEVEL_ERROR = "error"

Func writeLog($message, $level = $LEVEL_INFO)
   If Not isLogLevelEnabled($level) Then
	  Return
   EndIf

   local $text = createTextFromLogMessage($message, $level)

   If isLogToConsoleEnabled($level) Then
	  ConsoleWrite($text)
   EndIf

   if isLogToFileEnabled($level) Then
	  local $file = getFileOfLevel($level)
	  FileWrite($file, $text)
   EndIf

EndFunc

Func createTextFromLogMessage($message, $level)
   return getTime() & "    " & StringUpper($level) & getIndentation($level, 5) & $message & @CRLF
EndFunc

Func isLogFilesDeleteUponStart()
   return readLogProperty("delete_upon_start") = $GUI_CHECKED
EndFunc

Func getFileOfLevel($level)
   return readLogProperty($level & "_file_name", $level & ".log")
EndFunc

Func isLogLevelEnabled($level)
   return readLogProperty($level & "_enabled") = $GUI_CHECKED
EndFunc

Func isLogToConsoleEnabled($level)
   Return readLogProperty($level & "_console_enabled") = $GUI_CHECKED
EndFunc

Func isLogToFileEnabled($level)
   Return readLogProperty($level & "_file_enabled") = $GUI_CHECKED
EndFunc

Func readLogProperty($property, $default = "")
   Return IniRead($SETTINGS_INI_FILE, "log", $property, $default)
EndFunc