Func initMiniMap()
   openMiniMap()
   resizeMiniMap()
   relocateMiniMap()
EndFunc

Func openMiniMap()
   local $miniMapMenuButtonFile = getFilePath("mini_map_menu_button")
   local $x, $y
   if _ImageSearch($miniMapMenuButtonFile, 1, $x, $y, 50) Then
	  Click($x, $y)
	  Sleep(1000)
   Else
	  MsgBox(0, "Error", "Minimap menu button not found")
	  returnToGui()
   EndIf
EndFunc

Func resizeMiniMap()
   local $miniMapFile = getFilePath("mini_map")
   local $miniMapX, $miniMapY

   If Not _ImageSearch($miniMapFile, 0, $miniMapX, $miniMapY, 150) Then
	  MsgBox(0, "Error", "MiniMap not found.")
	  returnToGui()
	  Return
   EndIf

   local $resizeButtonFile = getFilePath("mini_map_resize_button")
   local $resizeButtonX = 1, $resizeButtonY = 1
   local $oldResizeButtonX = 0, $oldResizeButtonY = 0

   local $x1 = $miniMapX + 150
   local $y1 = $miniMapY
   local $x2 = $miniMapX + 500
   local $y2 = $miniMapY + 40

;~ Testing button pos area
;~    MouseMove($x1, $y1, 1000)
;~    Sleep(1000)

;~    MouseMove($x2, $y2, 1000)
;~    Sleep(1000)

   local $i, $x, $y
   For $i = 1 To 5
	  If Not _ImageSearchArea($resizeButtonFile, 1, $x1, $y1, $x2, $y2, $resizeButtonX, $resizeButtonY, 150) Then
		 MsgBox(0, "Not found", "MiniMap resize button not found.")
		 returnToGui()
		 Return
	  EndIf

	  If $oldResizeButtonX = $resizeButtonX And $oldResizeButtonY = $resizeButtonY Then
		 ExitLoop
	  EndIf

	  $oldResizeButtonX = $resizeButtonX
	  $oldResizeButtonY = $resizeButtonY

	  Click($resizeButtonX, $resizeButtonY)
	  Sleep(500)
   Next
EndFunc

Func relocateMiniMap()
   local $miniMapFile = getFilePath("mini_map")
   local $miniMapX, $miniMapY

   If Not _ImageSearch($miniMapFile, 0, $miniMapX, $miniMapY, 150) Then
	  MsgBox(0, "Error", "MiniMap not found.")
	  returnToGui()
	  Return
   EndIf

   MouseMove($miniMapX + 20, $miniMapY, 0)
   Sleep(500)
   MouseDown("left")
   MouseMove(@DesktopWidth - 185, 150)
   MouseUp("left")
   MouseMove(0,0,0)
EndFunc