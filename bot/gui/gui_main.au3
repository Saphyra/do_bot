#include <GUIConstantsEx.au3>
#include "main_window.au3"
#include "main_tab.au3"
#include "settings_general.au3"
#include "settings_log.au3"
#include "settings_repair.au3"
#include "image_search_test.au3"

Global Const $GUI_WIDTH = 500
Global Const $GUI_HEIGHT = 500

Global Const $DEFAULT_LABEL_HEIGHT = 20
Global Const $DEFAULT_LABEL_MARGIN = 20
Global Const $DEFAULT_INPUT_FIELD_HEIGHT = 24

Func createGui()
   writeLog("Creating GUI", $LEVEL_INFO)
   Opt("GUIOnEventMode", 1)

   createMainWindow()
   createMainTab()

   createGeneralSettingsTab()
   createRepairSettingsTab()
   createLogSettingsTab()

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