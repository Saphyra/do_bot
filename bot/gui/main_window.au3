Func createMainWindow()
   local $guiId = GUICreate("Saphybot", $guiWidth, $guiHeight)
	  GUISetOnEvent($GUI_EVENT_CLOSE, "Close", $guiId)

   return $guiId
EndFunc