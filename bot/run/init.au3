#include "init_map.au3"
#include "init_pet.au3"

Func init()
   writeLog("Initializing game windows...", $LEVEL_INFO)

   local $retryCount
   For $retryCount = 1 To 3
	  writeLog("Initializing game windows... Attempts: " & $retryCount, $LEVEL_INFO)

	  closeTabs()

	  If Not initMiniMap() Then
		 writeLog("Error occured during initializing minimap.", $LEVEL_ERROR)
		 ContinueLoop
	  EndIf

	  If Not initPet() Then
		 writeLog("Error occured during initializing PET", $LEVEL_ERROR)
		 ContinueLoop
	  EndIf

	  Return True
   Next

   writeLog("Error occured during initializing. Exiting...", $LEVEL_ERROR)
   MsgBox(0, "Error", "Error occured during initializing.")
   returnToGui()
   Return False
EndFunc

Func closeTabs()
   writeLog("Closing all tabs...", $LEVEL_INFO)

   MouseClick("left", @DesktopWidth / 2, @DesktopHeight / 2)
   Send("h")
   Sleep(1500)
EndFunc