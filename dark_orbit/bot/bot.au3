;~ For the exact @DesktopSize values
DllCall("User32.dll","bool","SetProcessDPIAware")

#include <Array.au3>
#include <ComboConstants.au3>
#include <editconstants.au3>
#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#include "general/functions.au3"

Global Const $SETTINGS_INI_FILE = getFilePath("settings_ini")

#include "general/ImageSearch.au3"
#include "general/logger.au3"

#include "general/startup.au3"

#include "gui/gui_main.au3"

#include "run/run_main.au3"

Global Const $STATE_GUI = 0
Global Const $STATE_RUN = 1
local $scriptState = $STATE_GUI

writeLog("Starting...", $LEVEL_INFO)
HotKeySet("{F2}", "showStatistics")

startUp()
createGui()

idle()
func idle()
   writeLog("Entering idle state", $LEVEL_INFO)

   While 1
	  Switch $scriptState
		 Case $STATE_RUN
			runProcess()
	  EndSwitch
	  Sleep(100)
   WEnd
EndFunc

Func shouldRun()
   If $scriptState <> $STATE_RUN Then
	  writeLog("Script is not in run state. Method should not run.", $LEVEL_DEBUG)
	  Return False
   ElseIf $runPaused Then
	  writeLog("Script is paused. Method should not run.", $LEVEL_DEBUG)
	  Return False
   Else
	  writeLog("Method should run.", $LEVEL_DEBUG)
	  Return True
   EndIf
EndFunc