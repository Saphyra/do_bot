#include "init.au3"

Global Const $mmx1 = @DesktopWidth - 200
Global Const $mmy1 = 195
Global Const $mmx2 = @DesktopWidth - 30
Global Const $mmy2 = 300

Global Const $ix1 = @DesktopWidth - 120
Global Const $iy1 = 160
Global Const $ix2 = @DesktopWidth - 50
Global Const $iy2 = 190

Global $moveStarted

Func startBot()
   GUISetState(@SW_HIDE, $mainWindowId)
   HotKeySet("{ESC}", "returnToGui")

   init()
   checkCoordinates()
   $scriptState = $STATE_RUN
EndFunc

Func checkCoordinates()
;~    MouseClick("left", $mmx1, $mmy1)
;~    Sleep(3000)

;~    MouseClick("left", $mmx2, $mmy2)
;~    Sleep(3000)

   MouseMove($ix1, $iy1)
   Sleep(3000)

   MouseMove($ix2, $iy2)
   Sleep(3000)
EndFunc

Func runProcess()
   local $x = Random($mmx1, $mmx2)
   local $y = Random($mmy1, $mmy2)
   MouseClick("left", $x, $y)
   $moveStarted = getTimeStamp()

   Sleep(500)
   idleStillMove()
EndFunc

Func idleStillMove()
   While isMove() = True
	  Sleep(500)
   WEnd
EndFunc

Func isMove()
   local $file = getFilePath("mini_map_no_move")
   local $x, $y
   local $result =  _ImageSearchArea($file, 0, $ix1, $iy1, $ix2, $iy2, $x, $y, 50)

   if $moveStarted + 60 < getTimeStamp() Then
	  return False
   EndIf

   return $result = 0
EndFunc