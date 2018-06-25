Func createMainWindow()
   Local $fontSize = 12

   local $guiId = GUICreate("Saphybot", $guiWidth, $guiHeight)
	  GUISetOnEvent($GUI_EVENT_CLOSE, "Close", $guiId)
	  GUISetFont($fontSize)

   return $guiId
EndFunc