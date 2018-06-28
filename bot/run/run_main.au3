#include "init.au3"
#include "move.au3"

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

;~    MouseMove($ix1, $iy1)
;~    Sleep(3000)

;~    MouseMove($ix2, $iy2)
;~    Sleep(3000)
EndFunc

Func runProcess()
   local $x = Random($mmx1, $mmx2)
   local $y = Random($mmy1, $mmy2)
   Click($x, $y)
   $moveStarted = getTimeStamp()

   Sleep(500)
   idleStillMove()
EndFunc