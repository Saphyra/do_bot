#include "collect.au3"
#include "check.au3"
#include "death.au3"
#include "init.au3"
#include "move.au3"
#include "pet.au3"

Global $runPaused = False
Global $runStarted = 0

Func startBot()
   writeLog("Starting bot", $LEVEL_INFO)

   GUISetState(@SW_HIDE, $mainWindowId)
   HotKeySet("{ESC}", "returnToGui")
   HotKeySet("{F1}", "pauseRun")
   $deathCount = 0
   $petDeathCount = 0
   $runStarted = getTimeStamp()
   Global $shouldSearchForBoxesSetting = IniRead($SETTINGS_INI_FILE, "general", "collect_while_move", $GUI_UNCHECKED) = $GUI_CHECKED

   If Not init() Then
	  Return
   EndIf

   $runPaused = False
   $scriptState = $STATE_RUN
EndFunc

Func runProcess()
   If Not shouldRun() Then
	  Return
   EndIf

   writeLog("Processing a run state...", $LEVEL_DEBUG)

   checkWindowState()
   collectBox()
   move()
   idleTillMove($shouldSearchForBoxesSetting)
EndFunc

Func resumeRun()
   writeLog("The bot is continuing the run.", $LEVEL_INFO)

   $runPaused = False
   HotKeySet("{F1}", "pauseRun")
EndFunc

Func pauseRun()
   writeLog("The bot is paused.", $LEVEL_INFO)

   $runPaused = True
   HotKeySet("{F1}", "resumeRun")
EndFunc