#include "init.au3"

Global Const $mmx1 = @DesktopWidth - 230
Global Const $mmy1 = 205
Global Const $mmx2 = @DesktopWidth - 30
Global Const $mmy2 = 340

Global Const $ix1 = @DesktopWidth - 360
Global Const $iy1 = 170
Global Const $ix2 = @DesktopWidth - 60
Global Const $iy2 = 200

Global $moveStarted

Func startBot()
   GUISetState(@SW_HIDE, $mainWindowId)
   HotKeySet("{ESC}", "returnToGui")

   init()
   $scriptState = $STATE_RUN
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