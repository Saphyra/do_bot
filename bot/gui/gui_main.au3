#include <GUIConstantsEx.au3>
#include "main_window.au3"
#include "main_tab.au3"
#include "log_settings.au3"
#include "image_search_test.au3"

Global Const $GUI_WIDTH = 500
Global Const $GUI_HEIGHT = 500

Func createGui()
   writeLog("Creating GUI", $LEVEL_INFO)
   Opt("GUIOnEventMode", 1)

   createMainWindow()
   createMainTab()
   createSettingsTab()

   createTestImageSearchTab()

   returnToGui()
EndFunc

Func returnToGui()
   writeLog("GUI window opened.", $LEVEL_INFO)

   HotKeySet("{ESC}", "close")
   HotKeySet("{F1}")
   $scriptState = $STATE_GUI
   GUISetState(@SW_SHOW, $mainWindowId)
EndFunc