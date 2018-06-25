#include <MsgBoxConstants.au3>
#include "general/ImageSearch.au3"

#include "general/functions.au3"

Global Const $STATE_GUI = 0
Global Const $STATE_RUN = 1

Global Const $FILES_INI_PATH = "data/files.ini"

#include "general/startup.au3"

Global $scriptState = $STATE_GUI

#include "gui/gui_main.au3"