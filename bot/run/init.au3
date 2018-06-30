#include "init_map.au3"
#include "init_pet.au3"

Func init()
   writeLog("Initializing game windows...", $LEVEL_INFO)

   closeTabs()
   initMiniMap()
   initPet()
EndFunc

Func closeTabs()
   writeLog("Closing all tabs...", $LEVEL_INFO)

   MouseClick("left", @DesktopWidth / 2, @DesktopHeight / 2)
   Send("h")
   Sleep(1500)
EndFunc