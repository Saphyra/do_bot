Func initPet()
   openPetWindow()
EndFunc

Func openPetWindow()
   local $file = getFilePath("pet_menu_button")
   local $x, $y

   if _ImageSearch($file, 1, $x, $y, 50) Then
	  Click($x, $y)
	  Sleep(1000)
   Else
	  MsgBox(0, "Error", "Minimap menu button not found")
	  returnToGui()
   EndIf
EndFunc