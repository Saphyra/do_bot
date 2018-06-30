Global Const $MINI_MAP_FILE = getFilePath("mini_map")
Global Const $MINI_MAP_RESIZE_BUTTON_FILE = getFilePath("mini_map_resize_button")

Func initMiniMap()
   writeLog("Initializing minimap", $LEVEL_INFO)

   openMiniMap()
   resizeMiniMap()
   relocateMiniMap()
EndFunc

Func openMiniMap()
   writeLog("Opening minimap...", $LEVEL_INFO)

   local $miniMapMenuButtonFile = getFilePath("mini_map_menu_button")
   local $x, $y
   if _ImageSearch($miniMapMenuButtonFile, 1, $x, $y, 50) Then
	  Click($x, $y)
	  Sleep(1000)
   Else
	  writeLog("MiniMap menu button not found.", $LEVEL_ERROR)
	  MsgBox(0, "Error", "Minimap menu button not found")
	  returnToGui()
   EndIf
EndFunc

Func resizeMiniMap()
   writeLog("Resizing minimap", $LEVEL_INFO)

   local $miniMapX, $miniMapY

   writeLog("Searching for minimap...", $LEVEL_DEBUG)
   If Not _ImageSearch($MINI_MAP_FILE, 0, $miniMapX, $miniMapY, 150) Then
	  writeLog("Minimap not found.", $LEVEL_ERROR)
	  MsgBox(0, "Error", "MiniMap not found.")
	  returnToGui()
	  Return
   EndIf


   local $resizeButtonX = 1, $resizeButtonY = 1
   local $oldResizeButtonX = 0, $oldResizeButtonY = 0

   local $x1 = $miniMapX + 150
   local $y1 = $miniMapY
   local $x2 = $miniMapX + 500
   local $y2 = $miniMapY + 40

   local $i, $x, $y
   For $i = 1 To 5
	  writeLog("Searching for resize button. Attempts: " & $i & " out of 5", $LEVEL_DEBUG)
	  If Not _ImageSearchArea($MINI_MAP_RESIZE_BUTTON_FILE, 1, $x1, $y1, $x2, $y2, $resizeButtonX, $resizeButtonY, 150) Then
		 writeLog("Minimap resize button not found.", $LEVEL_ERROR)
		 MsgBox(0, "Not found", "MiniMap resize button not found.")
		 returnToGui()
		 Return
	  EndIf

	  If $oldResizeButtonX = $resizeButtonX And $oldResizeButtonY = $resizeButtonY Then
		 writeLog("Minimap is already at its smallest size.", $LEVEL_DEBUG)
		 ExitLoop
	  EndIf

	  $oldResizeButtonX = $resizeButtonX
	  $oldResizeButtonY = $resizeButtonY

	  Click($resizeButtonX, $resizeButtonY)
	  Sleep(500)
   Next
EndFunc

Func relocateMiniMap()
   writeLog("Relocating minimap...", $LEVEL_INFO)
   local $miniMapX, $miniMapY

   If Not _ImageSearch($MINI_MAP_FILE, 0, $miniMapX, $miniMapY, 150) Then
	  writeLog("Minimap not found.", $LEVEL_ERROR)
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