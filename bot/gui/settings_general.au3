Func createGeneralSettingsTab()
   writeLog("Creating general settings tab...", $LEVEL_INFO)
   GUICtrlCreateTabItem("General")

   addShoulCollectByHand()

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

   MsgBox(0, "Saved", "Settings saved.", 5)
EndFunc