#include "init.au3"
#include "move.au3"

Global $runPaused = False

Func startBot()
   writeLog("Starting bot", $LEVEL_INFO)

   GUISetState(@SW_HIDE, $mainWindowId)
   HotKeySet("{ESC}", "returnToGui")
   HotKeySet("{F1}", "pauseRun")

   init()

   $runPaused = False
   $scriptState = $STATE_RUN
EndFunc

Func runProcess()
   If $runPaused = True Then
	  writeLog("Bot is paused.", $LEVEL_DEBUG)
	  Sleep(1000)
	  Return
   EndIf

   writeLog("Processing a run state...", $LEVEL_DEBUG)

   move()
   idleTillMove()
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