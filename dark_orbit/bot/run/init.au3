#include "init_map.au3"
#include "init_pet.au3"

Func init()
   If Not shouldRun() Then
	  Return
   EndIf

   writeLog("Initializing game windows...", $LEVEL_INFO)

   closeTabs()
   getNextCoordinates()

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

   Sleep(1000)
   Return True
EndFunc

Func closeTabs()
   If Not shouldRun() Then
	  Return
   EndIf

   writeLog("Closing all tabs...", $LEVEL_INFO)

   MouseClick("left", @DesktopWidth / 2, @DesktopHeight / 2)
   Send("h")
   Sleep(1500)
EndFunc

Func initMove()
   If Not shouldRun() Then
	  Return
   EndIf

   local $x
   If Round(Random(0, 1)) = 0 Then
	  $x = @DesktopWidth / 2 - 200
   Else
	  $x = @DesktopWidth / 2 + 200
   EndIf

   local $y
   If Round(Random(0, 1)) = 0 Then
	  $y = @DesktopHeight / 2 - 200
   Else
	  $y = @DesktopHeight / 2 + 200
   EndIf

   Click($x, $y)
   Sleep(1000)
EndFunc