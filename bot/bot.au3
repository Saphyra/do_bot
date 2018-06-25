#include <MsgBoxConstants.au3>

#include "general/functions.au3"

Global Const $STATE_GUI = 0
Global Const $STATE_RUN = 1

Global Const $FILES_INI_PATH = "data/files.ini"

#include "general/startup.au3"

local $scriptState = $STATE_GUI

#include "gui/gui_main.au3"

#include "run/run_main.au3"

idle()
func idle()
   While 1
	  Switch $scriptState
		 Case $STATE_RUN
	  EndSwitch
	  Sleep(100)
   WEnd
EndFunc