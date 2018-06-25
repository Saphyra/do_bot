#include <MsgBoxConstants.au3>

#include "general/functions.au3"
#include "general/startup.au3"

#include "gui/gui_main.au3"

#include "run/run_main.au3"

Global Const $FILES_INI_PATH = "data/files.ini"

Global Const $STATE_GUI = 0
Global Const $STATE_RUN = 1
local $scriptState = $STATE_GUI

startUp()
createGui()

idle()
func idle()
   While 1
	  Switch $scriptState
		 Case $STATE_RUN
	  EndSwitch
	  Sleep(100)
   WEnd
EndFunc