Func addStartButton()
   local $left = $guiWidth - 100
   local $top = $guiHeight - 30
   local $width = 100
   local $height = 30
   local $fontSize = 20

   local $id = GUICtrlCreateButton("Start", $left, $top, $width, $height)
   GUICtrlSetFont($id, $fontSize)

   GUICtrlSetOnEvent($id, "startBot")

   return $id
EndFunc