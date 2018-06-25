#include <GUIConstantsEx.au3>
#include "main_window.au3"
#include "start_button.au3"

Opt("GUIOnEventMode", 1)

Global Const $guiWidth = 500
Global Const $guiHeight = 500

Global $mainWindowId = createMainWindow()
Global $startButtonId = addStartButton()

GUISetState(@SW_SHOW, $mainWindowId)

While $scriptState = $STATE_GUI
   Sleep(100)
WEnd