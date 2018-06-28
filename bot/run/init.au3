#include "init_map.au3"

Func init()
   closeTabs()
   initMiniMap()
EndFunc

Func closeTabs()
   MouseClick("left", @DesktopWidth / 2, @DesktopHeight / 2)
   Send("h")
   Sleep(1000)
EndFunc