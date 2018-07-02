#include "init_map.au3"
#include "init_pet.au3"

Func init()
   writeLog("Initializing game windows...", $LEVEL_INFO)

   closeTabs()
   If Not initMiniMap() Then
	  writeLog("Error occured during initializing minimap.", $LEVEL_ERROR)
	  MsgBox(0, "Error", "Error occured during initializing minimap.")
	  returnToGui()
	  Return False
   EndIf

   If Not initPet() Then
	  writeLog("Error occured during initializing PET", $LEVEL_ERROR)
	  MsgBox(0, "Error", "Error occured during initializing PET")
	  returnToGui()
	  Return False
   EndIf

   Return True
EndFunc

Func closeTabs()
   writeLog("Closing all tabs...", $LEVEL_INFO)

   MouseClick("left", @DesktopWidth / 2, @DesktopHeight / 2)
   Send("h")
   Sleep(1500)
EndFunc