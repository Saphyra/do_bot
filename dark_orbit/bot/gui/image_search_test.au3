Func createTestImageSearchTab()
   GUICtrlCreateTabItem("Image Search test")

   GUICtrlCreateLabel("Image to search:", 20, 30, 150, 20)
   Global Const $TEST_FILE_NAME_FIELD_ID = GUICtrlCreateInput(getTestProperty("image_file"), 170, 30, $GUI_WIDTH - 220, 24)

   GUICtrlCreateLabel("Tolerance:", 20, 60, 150, 20)
   Global Const $TEST_TOLERANCE_FIELD_ID = GUICtrlCreateInput(getTestProperty("tolerance"), 170, 60, $GUI_WIDTH - 220, 24, $ES_NUMBER)

   GUICtrlCreateLabel("X1:", 20, 90, 30, 20)
   Global Const $TEST_X1_FIELD_ID = GUICtrlCreateInput(getTestProperty("x1"), 50, 90, 50, 24, $ES_NUMBER)

   GUICtrlCreateLabel("Y1:", 120, 90, 30, 20)
   Global Const $TEST_Y1_FIELD_ID = GUICtrlCreateInput(getTestProperty("y1"), 150, 90, 50, 24, $ES_NUMBER)

   GUICtrlCreateLabel("X2:", 220, 90, 30, 20)
   Global Const $TEST_X2_FIELD_ID = GUICtrlCreateInput(getTestProperty("x2"), 250, 90, 50, 24, $ES_NUMBER)

   GUICtrlCreateLabel("Y2:", 320, 90, 30, 20)
   Global Const $TEST_Y2_FIELD_ID = GUICtrlCreateInput(getTestProperty("y2"), 350, 90, 50, 24, $ES_NUMBER)

   local $left = $GUI_WIDTH - 200
   local $top = $GUI_HEIGHT - 30
   local $width = 200
   local $height = 30
   local $fontSize = 20

   local $id = GUICtrlCreateButton("Save and run", $left, $top, $width, $height)
   GUICtrlSetFont($id, $fontSize)

   GUICtrlSetOnEvent($id, "runImageTest")
EndFunc

Func getTestProperty($name)
   Return IniRead($SETTINGS_INI_FILE, "test", $name, 0)
EndFunc

Func runImageTest()
   local $x, $y
   local $file = GUICtrlRead($TEST_FILE_NAME_FIELD_ID)
   local $tolerance = GUICtrlRead($TEST_TOLERANCE_FIELD_ID)
   local $x1 = GUICtrlRead($TEST_X1_FIELD_ID)
   local $y1 = GUICtrlRead($TEST_X2_FIELD_ID)
   local $x2 = GUICtrlRead($TEST_Y1_FIELD_ID)
   local $y2 = GUICtrlRead($TEST_Y2_FIELD_ID)

   saveTestProperty("image_file", $file)
   saveTestProperty("tolerance", $tolerance)
   saveTestProperty("x1", $x1)
   saveTestProperty("y1", $y1)
   saveTestProperty("x2", $x2)
   saveTestProperty("y2", $y2)

   If $x2 = 0 Then
	  $x2 = @DesktopWidth
   EndIf
   If $y2 = 0 Then
	  $y2 = @DesktopHeight
   EndIf
   local $filePath = getFilePath($file)
   If $filePath == 0 Then
	  ConsoleWrite($filePath)
	  MsgBox(0, "Invalid image name", $file & " is not a valid image.")
	  Return
   EndIf

   GUISetState(@SW_HIDE, $mainWindowId)
   Sleep(2000)
   If _ImageSearchArea($filePath, 0, $x1, $y1, $x2, $y2, $x, $y, $tolerance) Then
	  MouseMove($x, $y)
	  MsgBox(0, "Image found.", "Image found at " & $x & "/" & $y)
   Else
	  MsgBox(0, "Image not found.", "Image not found.")
   EndIf

   GUISetState(@SW_SHOW, $mainWindowId)
EndFunc

Func saveTestProperty($name, $value)
   IniWrite($SETTINGS_INI_FILE, "test", $name, $value)
EndFunc