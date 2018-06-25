#include "init.au3"
#include <WinAPISys.au3>
Global Const $screenWidth = @DesktopWidth
Global Const $screenHeight = @DesktopHeight

Func startBot()
   GUISetState(@SW_HIDE, $mainWindowId)
   $scriptState = $STATE_RUN
   HotKeySet("{ESC}", "returnToGui")

   recognizeMinimap()
EndFunc