Global Const $PET_COLLECTOR_GEAR_ACTIVATED_FILE = getFilePath("pet_collector_gear_active")

Func isCollectorActivated()
   local $x, $y
   local $x1 = 210
   local $y1 = 230
   local $x2 = 240
   local $y2 = 270

   If _ImageSearchArea($PET_COLLECTOR_GEAR_ACTIVATED_FILE, 0, $x1, $y1, $x2, $y2, $x, $y, 100) Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc

Func isNeedToOpenPetWindow()
   local $x, $y
   checkDeath()
   Return _ImageSearch($PET_FILE, 0, $x, $y, 150) = 0
EndFunc