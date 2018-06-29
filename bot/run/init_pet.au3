Func initPet()
   openPetWindow()
   relocatePetWindow()
   turnOnPet()
EndFunc

Func openPetWindow()
   local $file = getFilePath("pet_menu_button")
   local $x, $y

   if _ImageSearch($file, 1, $x, $y, 50) Then
	  Click($x, $y)
	  Sleep(1000)
   Else
	  MsgBox(0, "Error", "Pet menu button not found")
	  returnToGui()
   EndIf
EndFunc

Func relocatePetWindow()
   local $file = getFilePath("pet")
   local $x, $y

   If Not _ImageSearch($file, 0, $x, $y, 150) Then
	  MsgBox(0, "Error", "Pet not found.")
	  returnToGui()
	  Return
   EndIf

   MouseMove($x + 20, $y, 0)
   Sleep(500)
   MouseDown("left")
   MouseMove(150, 150)
   MouseUp("left")
   MouseMove(0,0,0)
EndFunc

Func turnOnPet()
   $onFile = getFilePath("pet_is_on")
   local $onx, $ony

   local $x1 = 100
   local $y1 = 230
   local $x2 = 160
   local $y2 = 275

;~ Test pet activate button search area
;~    MouseMove($x1, $y1)
;~    Sleep(3000)

;~    MouseMove($x2, $y2)
;~    Sleep(3000)

   If Not _ImageSearchArea($onFile, 1, $x1, $y1, $x2, $y2, $onx, $ony, 150) Then
	  $turnOnFile = getFilePath("pet_turn_on")
	  local $tx, $ty

	  If _ImageSearchArea($turnOnFile, 1, $x1, $y1, $x2, $y2, $onx, $ony, 150) Then
		 Click($onx, $ony)
	  Else
		 MsgBox(0, "Error", "Pet turn on button not found.")
		 returnToGui()
	  EndIf
   EndIf
EndFunc