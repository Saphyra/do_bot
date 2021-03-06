Func createGeneralSettingsTab()
   writeLog("Creating general settings tab...", $LEVEL_INFO)
   GUICtrlCreateTabItem("General")

   addShoulCollectByHand()
   addAlarmEnabledWhenDeath()
   addUseCloakWhenDeath()
   addReconnect()

   addGeneralSettingsSaveButton()
EndFunc

Func addShoulCollectByHand()
   writeLog("Creating 'Should collect by hand' checkbox...", $LEVEL_INFO)

   local $x = $DEFAULT_LABEL_MARGIN
   local $y = 30
   local $width = 250
   Global Const $SHOULD_COLLECT_BY_HAND_CHECKBOX_ID = GUICtrlCreateCheckbox("Should collect by 'hand'", $x, $y, $width, $DEFAULT_LABEL_HEIGHT)

   GUICtrlSetState($SHOULD_COLLECT_BY_HAND_CHECKBOX_ID, IniRead($SETTINGS_INI_FILE, "general", "collect_while_move", $GUI_UNCHECKED))
EndFunc

Func addAlarmEnabledWhenDeath()
   writeLog("Creating 'Should collect by hand' checkbox...", $LEVEL_INFO)

   local $x = $DEFAULT_LABEL_MARGIN
   local $y = 60
   local $width = 250
   Global Const $ALARM_WHEN_DEATH_CHECKBOX_ID = GUICtrlCreateCheckbox("Alarm when death", $x, $y, $width, $DEFAULT_LABEL_HEIGHT)

   GUICtrlSetState($ALARM_WHEN_DEATH_CHECKBOX_ID, IniRead($SETTINGS_INI_FILE, "death", "alarm_when_death", $GUI_UNCHECKED))
EndFunc

Func addUseCloakWhenDeath()
   writeLog("Creating 'Use cloak when death' checkbox...", $LEVEL_INFO)

   local $x = $DEFAULT_LABEL_MARGIN
   local $y = 90
   local $width = 250
   Global Const $USE_CLOAK_WHEN_DEATH_CHECKBOX_ID = GUICtrlCreateCheckbox("Use cloak when death", $x, $y, $width, $DEFAULT_LABEL_HEIGHT)

   GUICtrlSetState($USE_CLOAK_WHEN_DEATH_CHECKBOX_ID, IniRead($SETTINGS_INI_FILE, "death", "use_cloak_when_death", $GUI_CHECKED))
EndFunc

Func addReconnect()
   writeLog("Creating 'Reconnect' checkbox...", $LEVEL_INFO)

   local $x = $DEFAULT_LABEL_MARGIN
   local $y = 120
   local $width = 250
   Global Const $SHOULD_RECONNECT_CHECKBOX_ID = GUICtrlCreateCheckbox("Reconnection enabled", $x, $y, $width, $DEFAULT_LABEL_HEIGHT)

   GUICtrlSetState($SHOULD_RECONNECT_CHECKBOX_ID, IniRead($SETTINGS_INI_FILE, "general", "reconnection_enabled", $GUI_UNCHECKED))
EndFunc

Func addGeneralSettingsSaveButton()
   writeLog("Creating generalSettingsSaveButton", $LEVEL_INFO)
   local $left = $GUI_WIDTH - 100
   local $top = $GUI_HEIGHT - 30
   local $width = 100
   local $height = 30
   local $fontSize = 20

   local $id = GUICtrlCreateButton("Save", $left, $top, $width, $height)
   GUICtrlSetFont($id, $fontSize)

   GUICtrlSetOnEvent($id, "saveGeneralSettings")
EndFunc

Func saveGeneralSettings()
   IniWrite($SETTINGS_INI_FILE, "general", "collect_while_move", GUICtrlRead($SHOULD_COLLECT_BY_HAND_CHECKBOX_ID))
   IniWrite($SETTINGS_INI_FILE, "death", "alarm_when_death", GUICtrlRead($ALARM_WHEN_DEATH_CHECKBOX_ID))
   IniWrite($SETTINGS_INI_FILE, "death", "use_cloak_when_death", GUICtrlRead($USE_CLOAK_WHEN_DEATH_CHECKBOX_ID))
   IniWrite($SETTINGS_INI_FILE, "general", "reconnection_enabled", GUICtrlRead($SHOULD_RECONNECT_CHECKBOX_ID))

   MsgBox(0, "Saved", "Settings saved.", 5)
EndFunc