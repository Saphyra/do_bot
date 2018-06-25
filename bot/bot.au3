#include <MsgBoxConstants.au3>

#include "general/functions.au3"

Global Const $STATE_GUI = 0
Global Const $STATE_RUN = 1

Global Const $FILES_INI_PATH = "data/files.ini"

Global $PATHS[] = []
$PATHS["settings_ini"] = "data/settings.ini"

Global $pathKeys = ["settings_ini"]

#include "general/startup.au3"

local $scriptState = $STATE_GUI

#include "gui/gui_main.au3"