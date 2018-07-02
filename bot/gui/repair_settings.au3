Func createRepairSettingsTab()
   writeLog("Creating repair settings tab...", $LEVEL_INFO)
   GUICtrlCreateTabItem("Repair settings")

   addShipRepairSettings()
   fillRepairShipSettings()

   addPetRepairSettings()
   fillRepairPetSettings()

   addSaveRepairSettingsButton()
EndFunc

Func addShipRepairSettings()
   writeLog("Creating repair ship setting elements...", $LEVEL_INFO)

   local $repairShipLabelX = $DEFAULT_LABEL_MARGIN
   local $repairShipLabelY = 30
   local $repairShipLabelWidth = 50
   local $shipLabel = GUICtrlCreateLabel("Ship", $repairShipLabelX, $repairShipLabelY, $repairShipLabelWidth, $DEFAULT_LABEL_HEIGHT)
   GUICtrlSetFont($shipLabel, 12, 700)

   local $repairShipEnableX = $DEFAULT_LABEL_MARGIN
   local $repairShipEnableY = 60
   local $repairShipEnableWidth = 200
   Global Const $REPAIR_SHIP_ENABLE_CHECKBOX_ID = GUICtrlCreateCheckbox("Repair ship upon death", $repairShipEnableX, $repairShipEnableY, $repairShipEnableWidth, $DEFAULT_LABEL_HEIGHT)

   local $repairShipMaxDeathCountLabelX = $repairShipEnableX + $repairShipEnableWidth + $DEFAULT_LABEL_MARGIN
   local $repairShipMaxDeathCountLabelY = 60
   local $repairShipMaxDeathCountLabelWidth = 130
   GUICtrlCreateLabel("Max death count:", $repairShipMaxDeathCountLabelX, $repairShipMaxDeathCountLabelY, $repairShipMaxDeathCountLabelWidth, $DEFAULT_LABEL_HEIGHT)

   local $repairShipMaxDeathCountX = $repairShipMaxDeathCountLabelX + $repairShipMaxDeathCountLabelWidth
   local $repairShipMaxDeathCountY = 60
   local $repairShipMaxDeathCountWidth = 30
   Global Const $REPAIR_SHIP_MAX_DEATH_COUNT_FIELD_ID = GUICtrlCreateInput("", $repairShipMaxDeathCountX, $repairShipMaxDeathCountY, $repairShipMaxDeathCountWidth, $DEFAULT_LABEL_HEIGHT, $ES_NUMBER)

   local $waitBeforeRepairLabelX = $DEFAULT_LABEL_MARGIN
   local $waitBeforeRepairLabelY = 90
   local $waitBeforeRepairLabelWidth = 150
   GUICtrlCreateLabel("Wait before repair:", $waitBeforeRepairLabelX, $waitBeforeRepairLabelY, $waitBeforeRepairLabelWidth, $DEFAULT_LABEL_HEIGHT)

   local $waitBeforeRepairX = $waitBeforeRepairLabelX + $waitBeforeRepairLabelWidth
   local $waitBeforeRepairY = 90
   local $waitBeforeRepairWidth = 45
   Global Const $REPAIR_SHIP_WAIT_BEFORE_REPAIR_FIELD_ID = GUICtrlCreateInput("", $waitBeforeRepairX, $waitBeforeRepairY, $waitBeforeRepairWidth, $DEFAULT_LABEL_HEIGHT, $ES_NUMBER)

   local $repairAtLabelX = $waitBeforeRepairX + $waitBeforeRepairWidth + $DEFAULT_LABEL_MARGIN
   local $repairAtLabelY = 90
   local $repairAtLabelWidth = 100
   GUICtrlCreateLabel("Repair at:", $repairAtLabelX, $repairAtLabelY, $repairAtLabelWidth, $DEFAULT_LABEL_HEIGHT)

   local $repairAtX = $repairAtLabelX + $repairAtLabelWidth
   local $repairAtY = 85
   local $repairAtWidth = 100
   Global Const $REPAIR_SHIP_AT_COMBO_ID = GUICtrlCreateCombo("", $repairAtX, $repairAtY, $repairAtWidth, $DEFAULT_LABEL_HEIGHT, $CBS_DROPDOWNLIST)
   GUICtrlSetData($REPAIR_SHIP_AT_COMBO_ID, "Base|Gate|Spot")

   GUICtrlCreateGraphic(0, $repairAtLabelY + 25 ,$GUI_WIDTH, 1, $SS_BLACKRECT)
EndFunc

Func fillRepairShipSettings()
   writeLog("Filling repair ship setting fields with data...", $LEVEL_INFO)

   GUICtrlSetState($REPAIR_SHIP_ENABLE_CHECKBOX_ID, IniRead($SETTINGS_INI_FILE, "death", "repair_ship_on_death", $GUI_UNCHECKED) = $GUI_CHECKED)
   GUICtrlSetData($REPAIR_SHIP_MAX_DEATH_COUNT_FIELD_ID, IniRead($SETTINGS_INI_FILE, "death", "max_ship_death_count", 1))
   GUICtrlSetData($REPAIR_SHIP_WAIT_BEFORE_REPAIR_FIELD_ID, IniRead($SETTINGS_INI_FILE, "death", "wait_before_repair_seconds", 10))
   _GUICtrlComboBox_SelectString($REPAIR_SHIP_AT_COMBO_ID, getRepairAt())
EndFunc

Func getRepairAt()
   local $value = IniRead($SETTINGS_INI_FILE, "death", "repair_at", 1)
   Switch $value
	  Case $REPAIR_AT_BASE:
		 Return "Base"
	  Case $REPAIR_AT_GATE:
		 Return "Gate"
	  Case $REPAIR_AT_SPOT:
		 Return "Spot"
   EndSwitch
EndFunc

Func addPetRepairSettings()
   writeLog("Creating PET repair setting elements...", $LEVEL_INFO)

   local $repairPetLabelX = $DEFAULT_LABEL_MARGIN
   local $repairPetLabelY = 120
   local $repairPetLabelWidth = 50
   local $petLabel = GUICtrlCreateLabel("PET", $repairPetLabelX, $repairPetLabelY, $repairPetLabelWidth, $DEFAULT_LABEL_HEIGHT)
   GUICtrlSetFont($petLabel, 12, 700)

   local $repairPetEnabledX = $DEFAULT_LABEL_MARGIN
   local $repairPetEnabledY = 150
   local $repairPetEnabledWidth = 130
   Global Const $REPAIR_PET_ENABLED_CHECKBOX_ID = GUICtrlCreateCheckbox("Enable repair", $repairPetEnabledX, $repairPetEnabledY, $repairPetEnabledWidth, $DEFAULT_LABEL_HEIGHT)

   local $maxPetDeathCountLabelX = $repairPetEnabledX + $repairPetEnabledWidth + $DEFAULT_LABEL_MARGIN
   local $maxPetDeathCountLabelY = 150
   local $maxPetDeathCountLabelWidth = 130
   GUICtrlCreateLabel("Max death count:", $maxPetDeathCountLabelX, $maxPetDeathCountLabelY, $maxPetDeathCountLabelWidth, $DEFAULT_LABEL_HEIGHT)

   local $maxPetDeathCountX = $maxPetDeathCountLabelX + $maxPetDeathCountLabelWidth
   local $maxPetDeathCountY = 150
   local $maxPetDeathCountWidth = 30
   Global Const $MAX_PET_DEATH_COUNT_FIELD_ID = GUICtrlCreateInput("", $maxPetDeathCountX, $maxPetDeathCountY, $maxPetDeathCountWidth, $DEFAULT_LABEL_HEIGHT, $ES_NUMBER)

   local $exitWhenPetDeathCountX = $DEFAULT_LABEL_MARGIN
   local $exitWhenPetDeathCountY = 180
   local $exitWhenPetDeathCountWidth = 300
   Global Const $EXIT_WHEN_PET_DEATH_COUNT_CHECKBOX_ID = GUICtrlCreateCheckbox("Exit when PET death limit reaches", $exitWhenPetDeathCountX, $exitWhenPetDeathCountY, $exitWhenPetDeathCountWidth, $DEFAULT_LABEL_HEIGHT)
EndFunc

Func fillRepairPetSettings()
   GUICtrlSetState($REPAIR_PET_ENABLED_CHECKBOX_ID, IniRead($SETTINGS_INI_FILE, "pet", "repair_pet", $GUI_UNCHECKED))
   GUICtrlSetData($MAX_PET_DEATH_COUNT_FIELD_ID, IniRead($SETTINGS_INI_FILE, "pet", "max_pet_death_count", 1))
   GUICtrlSetState($EXIT_WHEN_PET_DEATH_COUNT_CHECKBOX_ID, IniRead($SETTINGS_INI_FILE, "pet", "exit_when_too_much_pet_death", $GUI_CHECKED))
EndFunc

Func addSaveRepairSettingsButton()
   writeLog("Creating saveRepairSettingsButton...", $LEVEL_INFO)
   local $left = $GUI_WIDTH - 100
   local $top = $GUI_HEIGHT - 30
   local $width = 100
   local $height = 30
   local $fontSize = 20

   local $id = GUICtrlCreateButton("Save", $left, $top, $width, $height)
   GUICtrlSetFont($id, $fontSize)

   GUICtrlSetOnEvent($id, "saveRepairSettings")
EndFunc

Func saveRepairSettings()
   IniWrite($SETTINGS_INI_FILE, "death", "repair_ship_on_death", GUICtrlRead($REPAIR_SHIP_ENABLE_CHECKBOX_ID))
   IniWrite($SETTINGS_INI_FILE, "death", "max_ship_death_count", GUICtrlRead($REPAIR_SHIP_MAX_DEATH_COUNT_FIELD_ID))
   IniWrite($SETTINGS_INI_FILE, "death", "wait_before_repair_seconds", GUICtrlRead($REPAIR_SHIP_WAIT_BEFORE_REPAIR_FIELD_ID))
   IniWrite($SETTINGS_INI_FILE, "death", "repair_at", getRepairAtNumber())

   IniWrite($SETTINGS_INI_FILE, "pet", "repair_pet", GUICtrlRead($REPAIR_PET_ENABLED_CHECKBOX_ID))
   IniWrite($SETTINGS_INI_FILE, "pet", "max_pet_death_count", GUICtrlRead($MAX_PET_DEATH_COUNT_FIELD_ID))
   IniWrite($SETTINGS_INI_FILE, "pet", "exit_when_too_much_pet_death", GUICtrlRead($EXIT_WHEN_PET_DEATH_COUNT_CHECKBOX_ID))

   MsgBox(0, "Saved", "Settings saved.", 5)
EndFunc

Func getRepairAtNumber()
   local $text = GUICtrlRead($REPAIR_SHIP_AT_COMBO_ID)
   Switch $text
	  Case "Base"
		 Return $REPAIR_AT_BASE
	  Case "Gate"
		 Return $REPAIR_AT_GATE
	  Case "Spot"
		 Return $REPAIR_AT_SPOT
   EndSwitch
EndFunc