Global Const $MINI_MAP_NO_MOVE_FILE = getFilePath("mini_map_no_move")

;~ MiniMap move edges
Global Const $mmx1 = @DesktopWidth - 190
Global Const $mmy1 = 195
Global Const $mmx2 = @DesktopWidth - 50
Global Const $mmy2 = 300


;~ No move area edges
Global Const $ix1 = @DesktopWidth - 120
Global Const $iy1 = 160
Global Const $ix2 = @DesktopWidth - 50
Global Const $iy2 = 190

Global $moveStarted

Func move()
   local $x = Random($mmx1, $mmx2)
   local $y = Random($mmy1, $mmy2)
   writeLog("Moving to coordinates: " & $x & "/" & $y, $LEVEL_INFO)
   Click($x, $y)
   $moveStarted = getTimeStamp()

   Sleep(500)
EndFunc

Func idleTillMove()
   writeLog("Waiting for the ship reaches the target position", $LEVEL_INFO)
   While isMove() = True
	  Sleep(500)
   WEnd
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