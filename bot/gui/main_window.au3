Func createMainWindow()
   writeLog("Creating main window...", $LEVEL_INFO)

   Local $fontSize = 12

   local $guiId = GUICreate("Saphybot", $guiWidth, $guiHeight)
	  GUISetOnEvent($GUI_EVENT_CLOSE, "close", $guiId)
	  GUISetFont($fontSize)

   return $guiId
EndFunc