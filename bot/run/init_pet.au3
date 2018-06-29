Func initPet()
   openPetWindow()
   relocatePetWindow()
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