Global Const $PET_FILE = getFilePath("pet")
Global Const $PET_COLLECTOR_GEAR_FILE = getFilePath("pet_collector_gear")
Global Const $PET_DESTROYED_BUTTON_FILE = getFilePath("pet_destroyed_button")
Global Const $PET_GEAR_LIST_BUTTON_FILE = getFilePath("pet_gear_list_button")
Global Const $PET_IS_ON_FILE = getFilePath("pet_is_on")
Global Const $PET_MENU_BUTTON_FILE = getFilePath("pet_menu_button")
Global Const $PET_TURN_ON_FILE = getFilePath("pet_turn_on")

Global Const $REPAIR_PET_ENABLED = IniRead($SETTINGS_INI_FILE, "pet", "repair_pet", $GUI_CHECKED)
Global Const $MAX_PET_DEATH_COUNT = IniRead($SETTINGS_INI_FILE, "pet", "max_pet_death_count", 0)

Global Const $PET_ACTIVATE_X1 = 100
Global Const $PET_ACTIVATE_Y1 = 230
Global Const $PET_ACTIVATE_X2 = 160
Global Const $PET_ACTIVATE_Y2 = 275

Global $petDeathCount = 0

Func initPet($needOpen = True)
   local $attempts
   For $attempts = 1 To 3
	  writeLog("Initializing PET... Attempts: " & $attempts, $LEVEL_INFO)

	  local $openResult = True
	  if $needOpen = True Then
		 $openResult = openPetWindow()
	  EndIf

	  If Not $openResult Then
		 initMove()
		 ContinueLoop
	  EndIf

	  If Not relocatePetWindow() Then
		 initMove()
		 ContinueLoop
	  EndIf

	  If Not repairPet() Then
		 initMove()
		 ContinueLoop
	  EndIf

	  If Not turnOnPet() Then
		 initMove()
		 ContinueLoop
	  EndIf

	  If Not openPetGearMenu() Then
		 initMove()
		 ContinueLoop
	  EndIf

	  If Not activateCollectorGear() Then
		 initMove()
		 ContinueLoop
	  EndIf

	  Return True
   Next

   Return False
EndFunc

Func openPetWindow()
   writeLog("Opening PET window", $LEVEL_INFO)
   local $x, $y

   if _ImageSearch($PET_MENU_BUTTON_FILE, 1, $x, $y, 50) Then
	  Click($x, $y)
	  Sleep(1000)
   Else
	  writeLog("PET menu button not found.", $LEVEL_ERROR)
	  Return False
   EndIf

   Return True
EndFunc

Func relocatePetWindow()
   writeLog("Relocating PET window...", $LEVEL_INFO)
   local $x, $y

   If Not _ImageSearch($PET_FILE, 0, $x, $y, 150) Then
	  writeLog("PET not found.", $LEVEL_ERROR)
	  Return False
   EndIf

   MouseMove($x + 20, $y, 0)
   Sleep(500)
   MouseDown("left")
   MouseMove(150, 150)
   MouseUp("left")
   MouseMove(0,0,0)

   Return True
EndFunc

Func repairPet()
   writeLog("Checking PET health...", $LEVEL_INFO)
   local $x, $y
   If $REPAIR_PET_ENABLED = $GUI_CHECKED Then
	  If _ImageSearchArea($PET_DESTROYED_BUTTON_FILE, 1, $PET_ACTIVATE_X1, $PET_ACTIVATE_Y1, $PET_ACTIVATE_X2, $PET_ACTIVATE_Y2, $x, $y, 100) Then
		 $petDeathCount += 1
		 writeLog("The PET is destroyed. petDeadthCount: " & $petDeathCount, $LEVEL_WARN)

		 If $MAX_PET_DEATH_COUNT = -1 OR $petDeathCount < $MAX_PET_DEATH_COUNT Then
			writeLog("Repairing pet...", $LEVEL_WARN)
			Click($x, $y)
			Sleep(500)
		 Else
			writeLog("Pet death reached limit.", $LEVEL_WARN)
		 EndIf
	  EndIf
   EndIf

   Return True
EndFunc

Func turnOnPet()
   writeLog("Turning on PET...", $LEVEL_INFO)
   local $onx, $ony

   If Not _ImageSearchArea($PET_IS_ON_FILE, 1, $PET_ACTIVATE_X1, $PET_ACTIVATE_Y1, $PET_ACTIVATE_X2, $PET_ACTIVATE_Y2, $onx, $ony, 150) Then
	  local $tx, $ty

	  If _ImageSearchArea($PET_TURN_ON_FILE, 1, $PET_ACTIVATE_X1, $PET_ACTIVATE_Y1, $PET_ACTIVATE_X2, $PET_ACTIVATE_Y2, $onx, $ony, 150) Then
		 Click($onx, $ony)
	  Else
		 writeLog("PET turn on button not found.", $LEVEL_ERROR)
		 Return False
	  EndIf
   Else
	  writeLog("Pet is currently turned on.", $LEVEL_WARN)
   EndIf

   Return True
EndFunc

Func openPetGearMenu()
   writeLog("Opening PET gear menu...", $LEVEL_INFO)
   local $x, $y

;~    Pet Gear Search Area
   local $x1 = 350
   local $y1 = 245
   local $x2 = 365
   local $y2 = 260

   If _ImageSearchArea($PET_GEAR_LIST_BUTTON_FILE, 1, $x1, $y1, $x2, $y2, $x, $y, 150) Then
	  Click($x, $y)
	  Sleep(500)
   Else
	  writeLog("Pet gear list button not found", $LEVEL_WARN)
   EndIf

   Return True
EndFunc

Func activateCollectorGear()
   writeLog("Activating collector gear...", $LEVEL_INFO)
   local $x, $y

   local $x1 = 210
   local $y1 = 260
   local $x2 = 355
   local $y2 = @DesktopHeight

   If _ImageSearchArea($PET_COLLECTOR_GEAR_FILE, 1, $x1, $y1, $x2, $y2, $x, $y, 150) Then
	  Click($x, $y)
   Else
	  writeLog("Pet Collector Gear Not Found", $LEVEL_WARN)
	  Return False
   EndIf

   Return True
EndFunc