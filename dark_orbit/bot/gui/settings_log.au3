Func createLogSettingsTab()
   writeLog("Creating log settings tab...", $LEVEL_INFO)
   GUICtrlCreateTabItem("Log")

   addLogLevelSettings()
   addDeleteFilesSettings()
   fillLogSettingsWithData()
   addSaveLogSettingsButton()
EndFunc

Func addLogLevelSettings()
   writeLog("Adding log level setting fields", $LEVEL_INFO)

   ;~    DEBUG LEVEL
   writeLog("Creating debug label...", $LEVEL_DEBUG)
   local $debugLabelX = $DEFAULT_LABEL_MARGIN
   local $debugLabelY = 30
   local $debugLabelWidth = 60
   local $debugId = GUICtrlCreateLabel("Debug:", $debugLabelX, $debugLabelY, $debugLabelWidth, $DEFAULT_LABEL_HEIGHT)
   GUICtrlSetFont($debugId, 12, 700)

   writeLog("Creating debugEnabled checkbox...", $LEVEL_DEBUG)
   local $debugEnabledX = $debugLabelX + $debugLabelWidth + $DEFAULT_LABEL_MARGIN
   local $debugEnabledY = 30
   local $debugEnabledWidth = 100
   Global Const $DEBUG_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("Enabled", $debugEnabledX, $debugEnabledY, $debugEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Createing debugConsoleEnabled checkbox...", $LEVEL_DEBUG)
   local $debugConsoleEnabledX = $debugEnabledX + $debugEnabledWidth + $DEFAULT_LABEL_MARGIN
   local $debugConsoleEnabledY = 30
   local $debugConsoleEnabledWidth = 150
   Global Const $DEBUG_CONSOLE_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("Console enabled", $debugConsoleEnabledX, $debugConsoleEnabledY, $debugConsoleEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating debugFileEnabled checkbox...", $LEVEL_DEBUG)
   local $debugFileEnabledX = $debugEnabledX
   local $debugFileEnabledY = 60
   local $debugFileEnabledWidth = 120
   Global Const $DEBUG_FILE_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("File enabled", $debugFileEnabledX, $debugFileEnabledY, $debugFileEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating debugFile label...", $LEVEL_DEBUG)
   local $debugFileLabelX = $debugConsoleEnabledX
   local $debugFileLabelY = 60
   local $debugFileLabelWidth = 30
   GUICtrlCreateLabel("File: ", $debugFileLabelX, $debugFileLabelY, $debugFileLabelWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating debugFile input field...", $LEVEL_DEBUG)
   local $debugFileX = $debugFileLabelX + $debugFileLabelWidth + $DEFAULT_LABEL_MARGIN
   local $debugFileY = 60 - 2
   local $debugFileWidth = $GUI_WIDTH - $debugFileX - $DEFAULT_LABEL_MARGIN
   Global Const $DEBUG_FILE_PATH_FIELD_ID = GUICtrlCreateInput("", $debugFileX, $debugFileY, $debugFileWidth, $DEFAULT_INPUT_FIELD_HEIGHT)

   GUICtrlCreateGraphic(0, $debugFileEnabledY + 25 ,$GUI_WIDTH, 1, $SS_BLACKRECT)

;~    INFO LEVEL
   writeLog("Creating info label...", $LEVEL_DEBUG)
   local $infoLabelX = $DEFAULT_LABEL_MARGIN
   local $infoLabelY = 90
   local $infoLabelWidth = 60
   local $infoId = GUICtrlCreateLabel("Info:", $infoLabelX, $infoLabelY, $infoLabelWidth, $DEFAULT_LABEL_HEIGHT)
   GUICtrlSetFont($infoId, 12, 700)

   writeLog("Creating infoEnabled checkbox...", $LEVEL_DEBUG)
   local $infoEnabledX = $infoLabelX + $infoLabelWidth + $DEFAULT_LABEL_MARGIN
   local $infoEnabledY = 90
   local $infoEnabledWidth = 100
   Global Const $INFO_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("Enabled", $infoEnabledX, $infoEnabledY, $infoEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Createing infoConsoleEnabled checkbox...", $LEVEL_DEBUG)
   local $infoConsoleEnabledX = $infoEnabledX + $infoEnabledWidth + $DEFAULT_LABEL_MARGIN
   local $infoConsoleEnabledY = 90
   local $infoConsoleEnabledWidth = 150
   Global Const $INFO_CONSOLE_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("Console enabled", $infoConsoleEnabledX, $infoConsoleEnabledY, $infoConsoleEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating infoFileEnabled checkbox...", $LEVEL_DEBUG)
   local $infoFileEnabledX = $infoEnabledX
   local $infoFileEnabledY = 120
   local $infoFileEnabledWidth = 120
   Global Const $INFO_FILE_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("File enabled", $infoFileEnabledX, $infoFileEnabledY, $infoFileEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating infoFile label...", $LEVEL_DEBUG)
   local $infoFileLabelX = $infoConsoleEnabledX
   local $infoFileLabelY = 120
   local $infoFileLabelWidth = 30
   GUICtrlCreateLabel("File: ", $infoFileLabelX, $infoFileLabelY, $infoFileLabelWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating infoFile input field...", $LEVEL_DEBUG)
   local $infoFileX = $infoFileLabelX + $infoFileLabelWidth + $DEFAULT_LABEL_MARGIN
   local $infoFileY = 120 - 2
   local $infoFileWidth = $GUI_WIDTH - $infoFileX - $DEFAULT_LABEL_MARGIN
   Global Const $INFO_FILE_PATH_FIELD_ID = GUICtrlCreateInput("", $infoFileX, $infoFileY, $infoFileWidth, $DEFAULT_INPUT_FIELD_HEIGHT)

   GUICtrlCreateGraphic(0, $infoFileEnabledY + 25 ,$GUI_WIDTH, 1, $SS_BLACKRECT)

;~    WARN LEVEL
   writeLog("Creating warn label...", $LEVEL_DEBUG)
   local $warnLabelX = $DEFAULT_LABEL_MARGIN
   local $warnLabelY = 150
   local $warnLabelWidth = 60
   local $warnId = GUICtrlCreateLabel("Warn:", $warnLabelX, $warnLabelY, $warnLabelWidth, $DEFAULT_LABEL_HEIGHT)
   GUICtrlSetFont($warnId, 12, 700)

   writeLog("Creating warnEnabled checkbox...", $LEVEL_DEBUG)
   local $warnEnabledX = $warnLabelX + $warnLabelWidth + $DEFAULT_LABEL_MARGIN
   local $warnEnabledY = 150
   local $warnEnabledWidth = 100
   Global Const $WARN_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("Enabled", $warnEnabledX, $warnEnabledY, $warnEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Createing warnConsoleEnabled checkbox...", $LEVEL_DEBUG)
   local $warnConsoleEnabledX = $warnEnabledX + $warnEnabledWidth + $DEFAULT_LABEL_MARGIN
   local $warnConsoleEnabledY = 150
   local $warnConsoleEnabledWidth = 150
   Global Const $WARN_CONSOLE_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("Console enabled", $warnConsoleEnabledX, $warnConsoleEnabledY, $warnConsoleEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating warnFileEnabled checkbox...", $LEVEL_DEBUG)
   local $warnFileEnabledX = $warnEnabledX
   local $warnFileEnabledY = 180
   local $warnFileEnabledWidth = 120
   Global Const $WARN_FILE_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("File enabled", $warnFileEnabledX, $warnFileEnabledY, $warnFileEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating warnFile label...", $LEVEL_DEBUG)
   local $warnFileLabelX = $warnConsoleEnabledX
   local $warnFileLabelY = 180
   local $warnFileLabelWidth = 30
   GUICtrlCreateLabel("File: ", $warnFileLabelX, $warnFileLabelY, $warnFileLabelWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating warnFile input field...", $LEVEL_DEBUG)
   local $warnFileX = $warnFileLabelX + $warnFileLabelWidth + $DEFAULT_LABEL_MARGIN
   local $warnFileY = 180 - 2
   local $warnFileWidth = $GUI_WIDTH - $warnFileX - $DEFAULT_LABEL_MARGIN
   Global Const $WARN_FILE_PATH_FIELD_ID = GUICtrlCreateInput("", $warnFileX, $warnFileY, $warnFileWidth, $DEFAULT_INPUT_FIELD_HEIGHT)

   GUICtrlCreateGraphic(0, $warnFileEnabledY + 25 ,$GUI_WIDTH, 1, $SS_BLACKRECT)

   ;~    ERROR LEVEL
   writeLog("Creating error label...", $LEVEL_DEBUG)
   local $errorLabelX = $DEFAULT_LABEL_MARGIN
   local $errorLabelY = 210
   local $errorLabelWidth = 60
   local $errorId = GUICtrlCreateLabel("Error:", $errorLabelX, $errorLabelY, $errorLabelWidth, $DEFAULT_LABEL_HEIGHT)
   GUICtrlSetFont($errorId, 12, 700)

   writeLog("Creating errorEnabled checkbox...", $LEVEL_DEBUG)
   local $errorEnabledX = $errorLabelX + $errorLabelWidth + $DEFAULT_LABEL_MARGIN
   local $errorEnabledY = 210
   local $errorEnabledWidth = 100
   Global Const $ERROR_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("Enabled", $errorEnabledX, $errorEnabledY, $errorEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Createing errorConsoleEnabled checkbox...", $LEVEL_DEBUG)
   local $errorConsoleEnabledX = $errorEnabledX + $errorEnabledWidth + $DEFAULT_LABEL_MARGIN
   local $errorConsoleEnabledY = 210
   local $errorConsoleEnabledWidth = 150
   Global Const $ERROR_CONSOLE_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("Console enabled", $errorConsoleEnabledX, $errorConsoleEnabledY, $errorConsoleEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating errorFileEnabled checkbox...", $LEVEL_DEBUG)
   local $errorFileEnabledX = $errorEnabledX
   local $errorFileEnabledY = 240
   local $errorFileEnabledWidth = 120
   Global Const $ERROR_FILE_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("File enabled", $errorFileEnabledX, $errorFileEnabledY, $errorFileEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating errorFile label...", $LEVEL_DEBUG)
   local $errorFileLabelX = $errorConsoleEnabledX
   local $errorFileLabelY = 240
   local $errorFileLabelWidth = 30
   GUICtrlCreateLabel("File: ", $errorFileLabelX, $errorFileLabelY, $errorFileLabelWidth, $DEFAULT_LABEL_HEIGHT)

   writeLog("Creating errorFile input field...", $LEVEL_DEBUG)
   local $errorFileX = $errorFileLabelX + $errorFileLabelWidth + $DEFAULT_LABEL_MARGIN
   local $errorFileY = 240 - 2
   local $errorFileWidth = $GUI_WIDTH - $errorFileX - $DEFAULT_LABEL_MARGIN
   Global Const $ERROR_FILE_PATH_FIELD_ID = GUICtrlCreateInput("", $errorFileX, $errorFileY, $errorFileWidth, $DEFAULT_INPUT_FIELD_HEIGHT)

   GUICtrlCreateGraphic(0, $errorFileEnabledY + 25 ,$GUI_WIDTH, 1, $SS_BLACKRECT)
EndFunc

Func addDeleteFilesSettings()
   writeLog("Creating addDeleteFilesSettings checkbox...", $LEVEL_INFO)
   local $x = $DEFAULT_LABEL_MARGIN
   local $y = 270

   Global Const $SHOULD_DELETE_LOG_FILES_ID =GUICtrlCreateCheckbox("Delete log files upon start", $x, $y)
EndFunc

Func addSaveLogSettingsButton()
   writeLog("Creating saveLogSettingsButton...", $LEVEL_INFO)
   local $left = $GUI_WIDTH - 100
   local $top = $GUI_HEIGHT - 30
   local $width = 100
   local $height = 30
   local $fontSize = 20

   local $id = GUICtrlCreateButton("Save", $left, $top, $width, $height)
   GUICtrlSetFont($id, $fontSize)

   GUICtrlSetOnEvent($id, "saveLogSettings")
EndFunc

Func fillLogSettingsWithData()
   writeLog("Reading saved data and filling the log setting input fields...", $LEVEL_INFO)

   GUICtrlSetState($DEBUG_ENABLED_CHECKBOX_ID, getEnabledCheckboxStatusOf("debug"))
   GUICtrlSetState($INFO_ENABLED_CHECKBOX_ID, getEnabledCheckboxStatusOf("info"))
   GUICtrlSetState($WARN_ENABLED_CHECKBOX_ID, getEnabledCheckboxStatusOf("warn"))
   GUICtrlSetState($ERROR_ENABLED_CHECKBOX_ID, getEnabledCheckboxStatusOf("error"))

   GUICtrlSetState($DEBUG_CONSOLE_ENABLED_CHECKBOX_ID, getConsoleEnabledCheckboxStatusOf("debug"))
   GUICtrlSetState($INFO_CONSOLE_ENABLED_CHECKBOX_ID, getConsoleEnabledCheckboxStatusOf("info"))
   GUICtrlSetState($WARN_CONSOLE_ENABLED_CHECKBOX_ID, getConsoleEnabledCheckboxStatusOf("warn"))
   GUICtrlSetState($ERROR_CONSOLE_ENABLED_CHECKBOX_ID, getConsoleEnabledCheckboxStatusOf("error"))

   GUICtrlSetState($DEBUG_FILE_ENABLED_CHECKBOX_ID, getFileEnabledCheckboxStatusOf("debug"))
   GUICtrlSetState($INFO_FILE_ENABLED_CHECKBOX_ID, getFileEnabledCheckboxStatusOf("info"))
   GUICtrlSetState($WARN_FILE_ENABLED_CHECKBOX_ID, getFileEnabledCheckboxStatusOf("warn"))
   GUICtrlSetState($ERROR_FILE_ENABLED_CHECKBOX_ID, getFileEnabledCheckboxStatusOf("error"))

   GUICtrlSetData($DEBUG_FILE_PATH_FIELD_ID, getFileOfLevel("debug"))
   GUICtrlSetData($INFO_FILE_PATH_FIELD_ID, getFileOfLevel("info"))
   GUICtrlSetData($WARN_FILE_PATH_FIELD_ID, getFileOfLevel("warn"))
   GUICtrlSetData($ERROR_FILE_PATH_FIELD_ID, getFileOfLevel("error"))

   GUICtrlSetState($SHOULD_DELETE_LOG_FILES_ID, getDeleteOnStartCheckboxStatus())
EndFunc

Func getEnabledCheckboxStatusOf($level)
   If isLogLevelEnabled($level) Then
	  Return $GUI_CHECKED
   Else
	  Return $GUI_UNCHECKED
   EndIf
EndFunc

Func getConsoleEnabledCheckboxStatusOf($level)
   If isLogToConsoleEnabled($level) Then
	  Return $GUI_CHECKED
   Else
	  Return $GUI_UNCHECKED
   EndIf
EndFunc

Func getFileEnabledCheckboxStatusOf($level)
   If isLogToFileEnabled($level) Then
	  Return $GUI_CHECKED
   Else
	  Return $GUI_UNCHECKED
   EndIf
EndFunc

Func getDeleteOnStartCheckboxStatus()
   If isLogFilesDeleteUponStart() Then
	  Return $GUI_CHECKED
   Else
	  Return $GUI_UNCHECKED
   EndIf
EndFunc

Func saveLogSettings()
   writeLog("Saving Log settings...", $LEVEL_INFO)

   saveLogSettingsToFile("debug_enabled", GUICtrlRead($DEBUG_ENABLED_CHECKBOX_ID))
   saveLogSettingsToFile("info_enabled", GUICtrlRead($INFO_ENABLED_CHECKBOX_ID))
   saveLogSettingsToFile("warn_enabled", GUICtrlRead($WARN_ENABLED_CHECKBOX_ID))
   saveLogSettingsToFile("error_enabled", GUICtrlRead($ERROR_ENABLED_CHECKBOX_ID))

   saveLogSettingsToFile("debug_console_enabled", GUICtrlRead($DEBUG_CONSOLE_ENABLED_CHECKBOX_ID))
   saveLogSettingsToFile("info_console_enabled", GUICtrlRead($INFO_CONSOLE_ENABLED_CHECKBOX_ID))
   saveLogSettingsToFile("warn_console_enabled", GUICtrlRead($WARN_CONSOLE_ENABLED_CHECKBOX_ID))
   saveLogSettingsToFile("error_console_enabled", GUICtrlRead($ERROR_CONSOLE_ENABLED_CHECKBOX_ID))

   saveLogSettingsToFile("debug_file_enabled", GUICtrlRead($DEBUG_FILE_ENABLED_CHECKBOX_ID))
   saveLogSettingsToFile("info_file_enabled", GUICtrlRead($INFO_FILE_ENABLED_CHECKBOX_ID))
   saveLogSettingsToFile("warn_file_enabled", GUICtrlRead($WARN_FILE_ENABLED_CHECKBOX_ID))
   saveLogSettingsToFile("error_file_enabled", GUICtrlRead($ERROR_FILE_ENABLED_CHECKBOX_ID))

   saveLogSettingsToFile("debug_file_name", GUICtrlRead($DEBUG_FILE_PATH_FIELD_ID))
   saveLogSettingsToFile("info_file_name", GUICtrlRead($INFO_FILE_PATH_FIELD_ID))
   saveLogSettingsToFile("warn_file_name", GUICtrlRead($WARN_FILE_PATH_FIELD_ID))
   saveLogSettingsToFile("error_file_name", GUICtrlRead($ERROR_FILE_PATH_FIELD_ID))


   saveLogSettingsToFile("delete_upon_start", GUICtrlRead($SHOULD_DELETE_LOG_FILES_ID))

   MsgBox(0, "Saved", "Settings saved.", 5)
EndFunc

Func saveLogSettingsToFile($name, $value)
   IniWrite($SETTINGS_INI_FILE, "log", $name, $value)
EndFunc