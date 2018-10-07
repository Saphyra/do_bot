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

   returnToGui(False)
EndFunc

Func returnToGui($shouldShowStatistics = True)
   writeLog("GUI window opened.", $LEVEL_INFO)

   HotKeySet("{ESC}", "close")
   HotKeySet("{F1}")
   $scriptState = $STATE_GUI
   GUISetState(@SW_SHOW, $mainWindowId)
   If Not IsDeclared("shouldShowStatistics") Or $shouldShowStatistics Then
	  showStatistics()
   EndIf
EndFunc

Func showStatistics()
   writeLog("Displaying statistics...", $LEVEL_INFO)
   MsgBox(0, "Statistics", "Run time: " & getRunTime() & @CRLF & "Death count: " & $deathCount & @CRLF & "PET death count: " & $petDeathCount)
EndFunc

Func getRunTime()
   local $now = getTimeStamp()

   local $diff = $now - $runStarted

   local $hours = Floor($diff / 3600)
   local $minutes = Floor(($diff - $hours * 3600) / 60)
   local $seconds = $diff - $hours * 3600 - $minutes * 60

   If $hours < 10 Then
	  $hours = 0 & $hours
   EndIf

   If $minutes < 10 Then
	  $minutes = 0 & $minutes
   EndIf

   If $seconds < 10 Then
	  $seconds = 0 & $seconds
   EndIf

   return $hours & ":" & $minutes & ":" & $seconds
EndFunc