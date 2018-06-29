#include "init_map.au3"
#include "init_pet.au3"

Func init()
   closeTabs()
   initMiniMap()
   initPet()
EndFunc

Func closeTabs()
   MouseClick("left", @DesktopWidth / 2, @DesktopHeight / 2)
   Send("h")
   Sleep(1000)
EndFunc