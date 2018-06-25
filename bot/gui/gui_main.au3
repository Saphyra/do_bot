#include <GUIConstantsEx.au3>

local $mainWindowId
Opt("GUIOnEventMode", 1)


$mainWindowId = GUICreate("Saphybot", 500, 500)
GUISetOnEvent($GUI_EVENT_CLOSE, "Close")
GUISetState(@SW_SHOW, $mainWindowId)

While $scriptState = $STATE_GUI
   Sleep(100)
WEnd

Func Close()
   Exit
EndFunc