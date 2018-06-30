#include "start_button.au3"

Func createMaintab()
   writeLog("Creating mainTab", $LEVEL_INFO)
   local $id = GUICtrlCreateTab(0, 0, $GUI_WIDTH, $GUI_HEIGHT)
   GUICtrlCreateTabItem("Welcome")

   Global $startButtonId = addStartButton()

   return $id
EndFunc