Global Const $LEVEL_DEBUG = "debug"
Global Const $LEVEL_INFO = "info"
Global Const $LEVEL_WARN = "warn"
Global Const $LEVEL_ERROR = "error"

Func writeLog($message, $level = $LEVEL_INFO)
   If Not isLogLevelEnabled($level) Then
	  Return
   EndIf

   local $text = createTextFromLogMessage($message, $level)

   logToConsole($text, $level)

   if isLogToFileEnabled($level) Then
	  Switch $level
		 Case $LEVEL_DEBUG
			logToDebug($text)
		 Case $LEVEL_INFO
			logToDebug($text)
			logToInfo($text)
		 Case $LEVEL_WARN
			logToDebug($text)
			logToInfo($text)
			logToWarn($text)
		 Case $LEVEL_ERROR
			logToDebug($text)
			logToInfo($text)
			logToWarn($text)
			logToError($text)
	  EndSwitch
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

Func logToDebug($text)
   If Not isLogLevelEnabled($LEVEL_DEBUG) Then
	  Return
   EndIf
   If isLogToFileEnabled($LEVEL_DEBUG) Then
	  local $file = getFileOfLevel($LEVEL_DEBUG)
	  FileWrite($file, $text)
   EndIf
EndFunc

Func logToInfo($text)
   If Not isLogLevelEnabled($LEVEL_INFO) Then
	  Return
   EndIf
   If isLogToFileEnabled($lEVEL_INFO) Then
	  local $file = getFileOfLevel($lEVEL_INFO)
	  FileWrite($file, $text)
   EndIf
EndFunc

Func logToWarn($text)
   If Not isLogLevelEnabled($LEVEL_WARN) Then
	  Return
   EndIf
   If isLogToFileEnabled($lEVEL_WARN) Then
	  local $file = getFileOfLevel($lEVEL_WARN)
	  FileWrite($file, $text)
   EndIf
EndFunc

Func logToError($text)
   If Not isLogLevelEnabled($LEVEL_ERROR) Then
	  Return
   EndIf
   If isLogToFileEnabled($lEVEL_ERROR) Then
	  local $file = getFileOfLevel($lEVEL_ERROR)
	  FileWrite($file, $text)
   EndIf
EndFunc

Func logToConsole($text, $level)
   Switch $level
	  Case $LEVEL_DEBUG
		 If isLogLevelEnabled($LEVEL_DEBUG) And isLogToConsoleEnabled($LEVEL_DEBUG) Then
			ConsoleWrite($text)
			Return
		 EndIf
	  Case $LEVEL_INFO
		 If isLogLevelEnabled($LEVEL_DEBUG) And isLogToConsoleEnabled($LEVEL_DEBUG) Then
			ConsoleWrite($text)
			Return
		 EndIf
		 If isLogLevelEnabled($LEVEL_INFO) And isLogToConsoleEnabled($LEVEL_INFO) Then
			ConsoleWrite($text)
			Return
		 EndIf
	  Case $LEVEL_WARN
		 If isLogLevelEnabled($LEVEL_DEBUG) And isLogToConsoleEnabled($LEVEL_DEBUG) Then
			ConsoleWrite($text)
			Return
		 EndIf
		 If isLogLevelEnabled($LEVEL_INFO) And isLogToConsoleEnabled($LEVEL_INFO) Then
			ConsoleWrite($text)
			Return
		 EndIf
		 If isLogLevelEnabled($LEVEL_WARN) And isLogToConsoleEnabled($LEVEL_WARN) Then
			ConsoleWrite($text)
			Return
		 EndIf
	  Case $LEVEL_ERROR
		 If isLogLevelEnabled($LEVEL_DEBUG) And isLogToConsoleEnabled($LEVEL_DEBUG) Then
			ConsoleWrite($text)
			Return
		 EndIf
		 If isLogLevelEnabled($LEVEL_INFO) And isLogToConsoleEnabled($LEVEL_INFO) Then
			ConsoleWrite($text)
			Return
		 EndIf
		 If isLogLevelEnabled($LEVEL_WARN) And isLogToConsoleEnabled($LEVEL_WARN) Then
			ConsoleWrite($text)
			Return
		 EndIf
		 If isLogLevelEnabled($LEVEL_ERROR) And isLogToConsoleEnabled($LEVEL_ERROR) Then
			ConsoleWrite($text)
			Return
		 EndIf
   EndSwitch
EndFunc