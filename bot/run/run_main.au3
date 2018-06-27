#include "init.au3"
#include <WinAPISys.au3>

Global Const $mmx1 = @DesktopWidth - 230
Global Const $mmy1 = 205
Global Const $mmx2 = @DesktopWidth - 30
Global Const $mmy2 = 340

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
   Sleep(5000)
EndFunc