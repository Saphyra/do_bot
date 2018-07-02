Func createRepairSettingsTab()
   writeLog("Creating repair settings tab...", $LEVEL_INFO)
   GUICtrlCreateTabItem("Repair settings")

   addShipRepairSettings()
   fillRepairShipSettings()
EndFunc

Func addShipRepairSettings()
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
   local $repairAtY = 90
   local $repairAtWidth = 100
   Global Const $REPAIR_SHIP_AT_COMBO_ID = GUICtrlCreateCombo("", $repairAtX, $repairAtY, $repairAtWidth, $DEFAULT_LABEL_HEIGHT, $CBS_DROPDOWNLIST)
   GUICtrlSetData($REPAIR_SHIP_AT_COMBO_ID, "Base|Gate|Spot")
EndFunc

Func fillRepairShipSettings()

EndFunc