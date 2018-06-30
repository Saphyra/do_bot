#include <GUIConstantsEx.au3>
#include "main_window.au3"
#include "start_button.au3"
#include "input_field.au3"

Global Const $guiWidth = 500
Global Const $guiHeight = 500

Func createGui()
   writeLog("Creating GUI", $LEVEL_INFO)
   Opt("GUIOnEventMode", 1)

   Global $mainWindowId = createMainWindow()
   Global $startButtonId = addStartButton()
   Global $inputFieldId = addInputField()
   Global $saveButtonId = addSaveButton()

   returnToGui()
EndFunc

Func returnToGui()
   writeLog("GUI window opened.", $LEVEL_INFO)

   HotKeySet("{ESC}", "close")
   HotKeySet("{F1}")
   $scriptState = $STATE_GUI
   GUISetState(@SW_SHOW, $mainWindowId)
EndFunc