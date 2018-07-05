Global Const $MINI_MAP_NO_MOVE_FILE = getFilePath("mini_map_no_move")

;~ MiniMap move edges
Global Const $mmx1 = @DesktopWidth - 190
Global Const $mmy1 = 195
Global Const $mmx2 = @DesktopWidth - 60
Global Const $mmy2 = 300


;~ No move area edges
Global Const $ix1 = @DesktopWidth - 120
Global Const $iy1 = 160
Global Const $ix2 = @DesktopWidth - 50
Global Const $iy2 = 190

Global Const $ATTEMPTS_BEFORE_RESET_COORDINATES = 5
Global Const $MIN_DISTANCE = 10
Global $moveStarted
Global $coordinates = []
Global $xCoord = $mmx1
Global $yCoord = $mmy1

Func move()
   If Not $scriptState = $STATE_RUN Then
	  writeLog("It is not RUN state. Returning...", $LEVEL_DEBUG)
	  Return
   EndIf

   If Not isMiniMapWellLocated() Then
	  writeLog("Minimap is not at the right position.", $LEVEL_WARN)
	  local $x, $y
	  If Not initMiniMap(_ImageSearch($MINI_MAP_FILE, 0, $x, $y, 150) = 0) Then
		 writeLog("Minimap initialization failed. Exiting...", $LEVEL_ERROR)
		 MsgBox(0, "Error", "Minimap initialization failed. Exiting...")
		 returnToGui()
		 Return
	  EndIf
   EndIf

   writeLog("Moving to coordinates: " & $xCoord & "/" & $yCoord, $LEVEL_INFO)
   Click($xCoord, $yCoord)
   $moveStarted = getTimeStamp()

   Sleep(3000)
EndFunc

Func idleTillMove($shouldSearchBoxes = True)
   writeLog("Waiting for the ship reaches the target position", $LEVEL_INFO)
   local $isBoxFound = False
   While isMove() = True
	  Sleep(100)
	  If $shouldSearchBoxes = True Then
		 $isBoxFound = searchForBonusBox()
	  EndIf
   WEnd

   If Not $isBoxFound And $shouldSearchBoxes Then
	  getNextCoordinates()
   ElseIf Not $shouldSearchForBoxesSetting Then
	  getNextCoordinates()
   EndIf
EndFunc

Func isMove()
   local $x, $y
   local $imageFound =  _ImageSearchArea($MINI_MAP_NO_MOVE_FILE, 0, $ix1, $iy1, $ix2, $iy2, $x, $y, 10)

   if $moveStarted + 60 < getTimeStamp() Then
	  writeLog("The ship was moving more than 60 seconds.", $LEVEL_WARN)
	  return False
   EndIf

   local $result = $imageFound = 0
   writeLog("The ship is still moving: " & $result, $LEVEL_DEBUG)
   return $result
EndFunc

Func isMiniMapWellLocated()
   local $x, $y
   Return _ImageSearchArea($MINI_MAP_FILE, 0, $miniMapBaseX1, $miniMapBasey1, $miniMapBaseX2, $miniMapBaseY2, $x, $y, 150) = 1
EndFunc

Func getNextCoordinates()
   writeLog("Setting the coordinates of the next move.", $LEVEL_INFO)
   If Not attemptNextCoordinates() Then
	  writeLog("Cleaning coordinate stroage. Size: " & UBound($coordinates), $LEVEL_WARN)
	  Global $coordinates = []
	  attemptNextCoordinates()
   EndIf
EndFunc

Func attemptNextCoordinates()
   writeLog("Trying to attempt the next coordinate.", $LEVEL_INFO)
   local $try
   For $try = 1 To $ATTEMPTS_BEFORE_RESET_COORDINATES
	  local $x = Random($mmx1, $mmx2, 1)
	  local $y = Random($mmy1, $mmy2, 1)
	  local $coord = $x & "/" & $y

	  writeLog("New attempt: " & $x & "/" & $y & " - " & $try & " out of " & $ATTEMPTS_BEFORE_RESET_COORDINATES, $LEVEL_DEBUG)
	  If isCoordinateAssignable($x, $y) Then
		 writeLog($coord & " is assignable.", $LEVEL_DEBUG)
		 _ArrayAdd($coordinates, $coord)
		 $xCoord = $x
		 $yCoord = $y
		 Return True
	  EndIf
	  writeLog($coord & " is NOT assignable.", $LEVEL_DEBUG)
   Next

   writeLog("Could not find assignable coordinates out of " & $ATTEMPTS_BEFORE_RESET_COORDINATES & " attempts.", $LEVEL_INFO)
   Return False
EndFunc

Func isCoordinateAssignable($x, $y)
   writeLog("Checking if " & $x & "/" & $y & " is assignable...", $LEVEL_DEBUG)

   local $index
   For $index = 0 To UBound($coordinates) - 1
	  local $coordinate =  $coordinates[$index]
	  If Not $coordinate Then
		 ContinueLoop
	  EndIf

	  local $splitted = StringSplit($coordinate, "/")
	  local $sx = $splitted[1]
	  local $sy = $splitted[2]

	  If Abs($sx - $x) <= $MIN_DISTANCE And Abs($sy - $y) <= $MIN_DISTANCE Then
		 writeLog($x & "/" & $y & " is in range.", $LEVEL_DEBUG)
		 Return False
	  EndIf
   Next

   Return True
EndFunc