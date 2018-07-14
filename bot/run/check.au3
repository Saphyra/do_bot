Global Const $CONNECTION_LOST_FILE = getFilePath("connection_lost")

Global Const $RECONNECTION_ENABLED = IniRead($SETTINGS_INI_FILE, "general", "reconnection_enabled", $GUI_UNCHECKED)

Func checkWindowState()
   checkConnection()
   checkDeath()
   checkMiniMap()
   checkPet()
EndFunc

Func checkConnection()
   writeLog("Checking connection...", $LEVEL_DEBUG)

   local $x, $y
   If _ImageSearch($CONNECTION_LOST_FILE, 1, $x, $y, 50) Then
	  writeLog("Connection lost.", $LEVEL_WARN)
	  If $RECONNECTION_ENABLED Then
		 writeLog("Reconnecting...", $lEVEL_WARN)
		 MsgBox(0, "Connection lost.", "Reconnecting in 60 seconds.", 60)
		 Click($x, $y)
		 Sleep(5000)
		 closeTabs()
	  Else
		 writeLog("Reconnection disabled.", $LEVEL_ERROR)
		 MsgBox(0, "Connection lost.", "Exiting...")
		 returnToGui()
	  EndIf
   EndIf

EndFunc

Func checkDeath()
   If Not isShipDead() Then
	  writeLog("Ship is alive.", $lEVEL_DEBUG)
	  Return
   EndIf

   $deathCount += 1
   writeLog("The ship is dead. Death count: " & $deathCount, $LEVEL_WARN)

   If $MAX_SHIP_DEATH_COUNT = 0 OR $deathCount < $MAX_SHIP_DEATH_COUNT Then
	  repairShip()
   Else
	  writeLog("Max ship death count reached. Exiting...", $LEVEL_WARN)
	  MsgBox(0, "Too many death", "Max ship death count reached.")
	  returnToGui()
   EndIf
EndFunc

Func checkMiniMap()
   If Not isMiniMapWellLocated() Then
	  writeLog("Minimap is not at the right position.", $LEVEL_WARN)
	  local $x, $y
	  If Not initMiniMap() Then
		 writeLog("Minimap initialization failed. Exiting...", $LEVEL_ERROR)
		 returnToGui()
		 MsgBox(0, "Error", "Minimap initialization failed. Exiting...")
		 Return
	  EndIf
   EndIf
EndFunc

Func isMiniMapWellLocated()
   local $x, $y
   Return _ImageSearchArea($MINI_MAP_FILE, 0, $miniMapBaseX1, $miniMapBasey1, $miniMapBaseX2, $miniMapBaseY2, $x, $y, 150) = 1
EndFunc

Func checkPet()
   writeLog("Checking PET status...", $LEVEL_INFO)

   If Not isCollectorActivated() Then
	  writeLog("Collector gear is not activated.", $LEVEL_WARN)

	  If Not initPet(isNeedToOpenPetWindow()) Then
		 writeLog("PET initialization failed. Exiting...", $LEVEL_ERROR)
		 MsgBox(0, "Error", "PET initialization failed. Exiting...")
		 returnToGui()
	  EndIf
   EndIf
EndFunc