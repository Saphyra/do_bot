Global $mainWindowId

Func createMainWindow()
   writeLog("Creating main window...", $LEVEL_INFO)

   Local $fontSize = 12

   $mainWindowId = GUICreate("Saphybot", $GUI_WIDTH, $GUI_HEIGHT)
	  GUISetOnEvent($GUI_EVENT_CLOSE, "close", $mainWindowId)
	  GUISetFont($fontSize)
EndFunc