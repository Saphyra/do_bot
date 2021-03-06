Global Const $REPAIR_AT_BASE = 1
Global Const $REPAIR_AT_GATE = 2
Global Const $REPAIR_AT_SPOT = 3

Global Const $SHIP_DESTROYED_FILE = getFilePath("ship_destroyed")
Global Const $SHIP_REPAIR_BUTTON_FILE = getFilePath("ship_repair_button")
Global Const $REPAIR_AT_BASE_FILE = getFilePath("repair_at_base")
Global Const $REPAIR_AT_GATE_FILE = getFilePath("repair_at_gate")
Global Const $REPAIR_AT_SPOT_FILE = getFilePath("repair_at_spot")
Global Const $CLOAK_10_FILE = getFilePath("cloak_10")
Global Const $CLOAK_50_FILE = getFilePath("cloak_50")

Global Const $MAX_SHIP_DEATH_COUNT = IniRead($SETTINGS_INI_FILE, "death", "max_ship_death_count", 0)
Global COnst $REPAIR_AT = IniRead($SETTINGS_INI_FILE, "death", "repair_at", 0)
Global Const $REPAIR_SHIP_ON_DEATH = IniRead($SETTINGS_INI_FILE, "death", "repair_ship_on_death", $GUI_UNCHECKED)
Global Const $WAIT_BEFORE_REPAIR_SECONDS = IniRead($SETTINGS_INI_FILE, "death", "wait_before_repair_seconds", 10)

Global Const $ALARM_WHEN_DEATH_ENABLED = IniRead($SETTINGS_INI_FILE, "death", "alarm_when_death", $GUI_UNCHECKED) = $GUI_CHECKED
Global Const $USE_CLOAK_WHEN_DEATH_ENABLED = IniRead($SETTINGS_INI_FILE, "death", "use_cloak_when_death", $GUI_CHECKED) = $GUI_CHECKED

Global $deathCount = 0

Func isShipDead()
   local $x, $y
   If _ImageSearch($SHIP_DESTROYED_FILE, 0, $x, $y, 50) Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc

Func repairShip()
   If Not shouldRun() Then
	  Return
   EndIf

   writeLog("Reapiring ship...", $LEVEL_WARN)
   If $ALARM_WHEN_DEATH_ENABLED Then
	  deathAlarm()
   EndIf
   MsgBox(0, "Ship is dead.", "Ship is dead. Will be repaired in " & $WAIT_BEFORE_REPAIR_SECONDS & " seconds.", $WAIT_BEFORE_REPAIR_SECONDS)
   Sleep(1000)
   local $repairAt
   Switch $REPAIR_AT
	  Case $REPAIR_AT_BASE
		 $repairAt = $REPAIR_AT_BASE_FILE
	  Case $REPAIR_AT_GATE
		 $repairAt = $REPAIR_AT_GATE_FILE
	  Case $REPAIR_AT_SPOT
		 $repairAt = $REPAIR_AT_SPOT_FILE
   EndSwitch

   local $rx, $ry
   If _ImageSearch($repairAt, 1, $rx, $ry, 150) Then
	  writeLog("Repairing: " & $repairAt, $LEVEL_WARN)
	  Click($rx, $ry)
	  Sleep(2000)

	  local $bx, $by
	  If _ImageSearch($SHIP_REPAIR_BUTTON_FILE, 1, $bx, $by, 50) Then
		 writeLog("Clicking on repair button...", $LEVEL_INFO)
		 Click($bx, $by)
		 Sleep(5000)
		 If $USE_CLOAK_WHEN_DEATH_ENABLED Then
			useCloak()
		 EndIf
	  Else
		 writeLog("Ship repair button not found.", $LEVEL_ERROR)
		 MsgBox(0, "Not found", "Ship repair button not found.")
		 returnToGui()
	  EndIf
   Else
	  writeLog($repairAt & " image not found.", $LEVEL_ERROR)
	  MsgBox(0, "Not Found", $repairAt & " image not found.")
	  returnToGui()
   EndIf
EndFunc

Func deathAlarm()
   If Not shouldRun() Then
	  Return
   EndIf

   local $i
   For $i = 1 To 5
	  Beep()
	  Beep(1000)
   Next
EndFunc

Func useCloak()
   If Not shouldRun() Then
	  Return
   EndIf

   local $x, $y
   If _ImageSearch($CLOAK_10_FILE, 1, $x, $y, 50) Or _ImageSearch($CLOAK_50_FILE, 1, $x, $y, 50) Then
	  writeLog("Activating cloak...", $LEVEL_INFO)
	  Click($x, $y)
   Else
	  writeLog("Cloak not found.", $LEVEL_ERROR)
   EndIf
EndFunc