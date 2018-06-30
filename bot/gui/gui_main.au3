#include <GUIConstantsEx.au3>
#include "main_window.au3"
#include "start_button.au3"
#include "input_field.au3"

Global Const $guiWidth = 500
Global Const $guiHeight = 500

Func createGui()
   Opt("GUIOnEventMode", 1)

   Global $mainWindowId = createMainWindow()
   Global $startButtonId = addStartButton()
   Global $inputFieldId = addInputField()
   Global $saveButtonId = addSaveButton()

   GUISetState(@SW_SHOW, $mainWindowId)
EndFunc

Func returnToGui()
   HotKeySet("{ESC}", "close")
   HotKeySet("{F1}")
   $scriptState = $STATE_GUI
   GUISetState(@SW_SHOW, $mainWindowId)
EndFunc