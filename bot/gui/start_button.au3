Func addStartButton()
   writeLog("Adding start button to main window", $LEVEL_INFO)

   local $left = $GUI_WIDTH - 100
   local $top = $GUI_HEIGHT - 30
   local $width = 100
   local $height = 30
   local $fontSize = 20

   local $id = GUICtrlCreateButton("Start", $left, $top, $width, $height)
   GUICtrlSetFont($id, $fontSize)

   GUICtrlSetOnEvent($id, "startBot")

   return $id
EndFunc