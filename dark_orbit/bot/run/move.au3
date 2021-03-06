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
   If Not shouldRun() Then
	  Return
   EndIf

   writeLog("Moving to coordinates: " & $xCoord & "/" & $yCoord, $LEVEL_INFO)
   Click($xCoord, $yCoord)
   $moveStarted = getTimeStamp()

   Sleep(3000)
EndFunc

Func idleTillMove($shouldSearchBoxes = True)
   If Not shouldRun() Then
	  Return
   EndIf

   writeLog("Waiting for the ship reaches the target position", $LEVEL_INFO)

   local $isBoxFound = False
   While isMove() = True
	  Sleep(100)

	  If Not shouldRun() Then
		 Return
	  EndIf

	  If isShipDead() Then
		 writeLog("The ship was killed while moving.", $LEVEL_INFO)
		 ExitLoop
	  EndIf

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

   if Abs($moveStarted - getTimeStamp()) > 60 Then
	  writeLog("The ship was moving more than 60 seconds.", $LEVEL_WARN)
	  return False
   EndIf

   local $result = $imageFound = 0
   writeLog("The ship is still moving: " & $result, $LEVEL_DEBUG)
   return $result
EndFunc

Func getNextCoordinates()
   writeLog("Setting the coordinates of the next move.", $LEVEL_INFO)
   If Not attemptNextCoordinates() Then
	  writeLog("Cleaning coordinate stroage. Size: " & UBound($coordinates), $LEVEL_INFO)
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