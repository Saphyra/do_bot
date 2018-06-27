Func createMainWindow()
   Local $fontSize = 12

   local $guiId = GUICreate("Saphybot", $guiWidth, $guiHeight)
	  GUISetOnEvent($GUI_EVENT_CLOSE, "close", $guiId)
	  GUISetFont($fontSize)

   return $guiId
EndFunc