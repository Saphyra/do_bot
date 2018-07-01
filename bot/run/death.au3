Global Const $REPAIR_AT_BASE = 1
Global Const $REPAIR_AT_GATE = 2
Global Const $REPAIR_AT_SPOT = 3

Global Const $SHIP_DESTROYED_FILE = getFilePath("ship_destroyed")
Global Const $SHIP_REPAIR_BUTTON_FILE = getFilePath("ship_repair_button")
Global Const $REPAIR_AT_BASE_FILE = getFilePath("repair_at_base")
Global Const $REPAIR_AT_GATE_FILE = getFilePath("repair_at_gate")
Global Const $REPAIR_AT_SPOT_FILE = getFilePath("repair_at_spot")

Global Const $MAX_SHIP_DEATH_COUNT = IniRead($SETTINGS_INI_FILE, "death", "max_ship_death_count", 0)
Global COnst $REPAIR_AT = IniRead($SETTINGS_INI_FILE, "death", "repair_at", 0)
Global Const $REPAIR_SHIP_ON_DEATH = IniRead($SETTINGS_INI_FILE, "death", "repair_ship_on_death", $GUI_UNCHECKED)
Global Const $WAIT_BEFORE_REPAIR_SECONDS = IniRead($SETTINGS_INI_FILE, "death", "wait_before_repair_seconds", 10)

Global $deathCount = 0

Func checkDeath()
   If Not isShipDead() Then
	  writeLog("Ship is alive.", $lEVEL_DEBUG)
	  Return
   EndIf

   $deathCount += 1
   writeLog("The ship is dead. Death count: " & $deathCount, $LEVEL_WARN)

   If $MAX_SHIP_DEATH_COUNT = -1 OR $deathCount < $MAX_SHIP_DEATH_COUNT Then
	  repairShip()
   Else
	  writeLog("Max ship death count reached. Exiting...", $LEVEL_WARN)
	  MsgBox(0, "Too many death", "Max ship death count reached.")
	  returnToGui()
   EndIf
EndFunc

Func isShipDead()
   local $x, $y
   If _ImageSearch($SHIP_DESTROYED_FILE, 0, $x, $y, 50) Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc

Func repairShip()
   writeLog("Reapiring ship...", $LEVEL_WARN)
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

   local $x, $y
   If _ImageSearch($repairAt, 1, $x, $y, 150) Then
	  writeLog("Repairing: " & $repairAt, $LEVEL_WARN)
	  Click($x, $y)
	  Sleep(2000)

	  If _ImageSearch($SHIP_REPAIR_BUTTON_FILE, 1, $x, $y, 150) Then
		 writeLog("Clicking on repair button...", $LEVEL_INFO)
		 Click($x, $y)
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