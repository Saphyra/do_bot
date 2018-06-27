Func init()
   closeTabs()
   initMiniMap()
EndFunc

Func closeTabs()
   MouseClick("left", @DesktopWidth / 2, @DesktopHeight / 2)
   Send("h")
   Sleep(1000)
EndFunc

Func initMiniMap()
   openMiniMap()
   resizeMiniMap()
   relocateMiniMap()
EndFunc

Func openMiniMap()
   local $miniMapMenuButtonFile = getFilePath("mini_map_menu_button")
   local $x, $y
   if _ImageSearch($miniMapMenuButtonFile, 1, $x, $y, 50) Then
	  MouseClick("left", $x, $y)
	  Sleep(1000)
   Else
	  MsgBox(0, "Error", "Minimap menu button not found")
	  returnToGui()
   EndIf
EndFunc

Func resizeMiniMap()
   local $miniMapFile = getFilePath("mini_map")
   local $miniMapX, $miniMapY

   local $resizeButtonFile = getFilePath("mini_map_resize_button")
   local $resizeButtonX = 1, $resizeButtonY = 1
   local $oldResizeButtonX = 0, $oldResizeButtonY = 0

   If Not _ImageSearch($miniMapFile, 0, $miniMapX, $miniMapY, 150) Then
	  MsgBox(0, "Error", "MiniMap not found.")
	  returnToGui()
	  Return
   EndIf

   local $x1 = $miniMapX + 150
   local $y1 = $miniMapY + 20
   local $x2 = $miniMapX + 1000
   local $y2 = $miniMapY + 75

;~    MouseMove($x1, $y1, 1000)
;~    Sleep(1000)

;~    MouseMove($x2, $y2, 1000)
;~    Sleep(1000)

   local $i, $x, $y
   For $i = 1 To 5
	  If Not _ImageSearchArea($resizeButtonFile, 1, $x1, $y1, $x2, $y2, $resizeButtonX, $resizeButtonY, 50) Then
		 MsgBox(0, "Not found", "MiniMap resize button not found.")
		 returnToGui()
		 Return
	  EndIf

	  If $oldResizeButtonX = $resizeButtonX And $oldResizeButtonY = $resizeButtonY Then
		 ExitLoop
	  EndIf

	  $oldResizeButtonX = $resizeButtonX
	  $oldResizeButtonY = $resizeButtonY

	  MouseClick("left", $resizeButtonX, $resizeButtonY, 1, 0)
	  MouseMove(0, 0)
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

   MouseMove($miniMapX + 20, $miniMapY)
   Sleep(500)
   MouseDown("left")
   MouseMove(@DesktopWidth - 230, 150)
   MouseUp("left")
EndFunc














Func recognizeMinimap()
   local $miniMapFile = getFilePath("mini_map")
   local $miniMapX, $miniMapY

   local $resizeButtonFile = getFilePath("mini_map_resize_button")
   local $resizeButtonX, $resizeButtonY

   local $topLeftCornerFile = getFilePath("mini_map_top_left_corner")
   local $topLeftCornerX, $topLeftCornerY

   local $bottomRightCornerFile = getFilePath("mini_map_bottom_right_corner")
   local $bottomRightCornerX, $bottomRightCornerY

   If Not _ImageSearch($miniMapFile, 0, $miniMapX, $miniMapY, 150) Then
	  MsgBox(0, "Not found", "MiniMap not found.")
	  returnToGui()
	  Return
   EndIf

   local $x1 = $miniMapX + 150
   local $y1 = $miniMapY + 20
   local $x2 = $miniMapX + 1000
   local $y2 = $miniMapY + 75

;~    MouseMove($x1, $y1, 1000)
;~    Sleep(1000)

;~    MouseMove($x2, $y2, 1000)
;~    Sleep(1000)

   If Not _ImageSearchArea($resizeButtonFile, 1, $x1, $y1, $x2, $y2, $resizeButtonX, $resizeButtonY, 50) Then
	  MsgBox(0, "Not found", "MiniMap resize button not found.")
	  returnToGui()
	  Return
   EndIf

   ConsoleWrite("\nResize button coordinates: " & $resizeButtonX & "/" & $resizeButtonY)


   local $x3 = $miniMapX - 50
   local $y3 = $miniMapY
   local $x4 = $miniMapX + 275
   local $y4 = $miniMapY + 230

   MouseMove($x3, $y3, 1000)
   Sleep(1000)

   MouseMove($x4, $y4, 1000)
   Sleep(1000)

   local $topLeftFound, $bottomRightFound, $needResize
   local $attempts = 0

   Do
	  $topLeftFound = _ImageSearchArea($topLeftCornerFile, 0, $x3, $y3, $x4, $y4, $topLeftCornerX, $topLeftCornerY, 50)
	  $bottomRightFound = _ImageSearchArea($bottomRightCornerFile, 0, $x3, $y3, $x4, $y4, $bottomRightCornerX, $bottomRightCornerY, 50)
	  $attempts += 1

	  $needResize = $topLeftFound = 0 Or $bottomRightFound = 0
	  ConsoleWrite($needResize & "/" & $topLeftFound & "/" & $bottomRightFound)
	  If $needResize = True Then
		 ConsoleWrite("Clicking on resize Button")
		 MouseClick("left", $resizeButtonX, $resizeButtonY, 1, 10)
		 Sleep(1000)
		 MouseMove(0, 0, 10)

		 If Not _ImageSearchArea($resizeButtonFile, 1, $x1, $y1, $x2, $y2, $resizeButtonX, $resizeButtonY, 50) Then
			MsgBox(0, "Not found", "MiniMap resize button not found.")
			returnToGui()
			Return
		 EndIf
	  EndIf
   Until Not $needResize Or $attempts = 10

   If $needResize Then
	  MsgBox(0, "Not found", "Edges of MiniMap not found.")
	  returnToGui()
	  Return
   EndIf

   MsgBox(0, "Success", "Everything is found", 1)

;~    MouseMove($miniMapX, $miniMapY, 1000)
;~    Sleep(3000)

   MouseMove($topLeftCornerX, $topLeftCornerY, 1000)
   Sleep(3000)

   MouseMove($bottomRightCornerX, $bottomRightCornerY, 1000)
   Sleep(3000)
   returnToGui()
EndFunc