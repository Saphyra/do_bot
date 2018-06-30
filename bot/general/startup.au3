#include "file_check.au3"

Global Const $FILES_INI_PATH = "data/files.ini"

Func startUp()
   writeLog("StartUp checks started...", $LEVEL_INFO)
   checkFiles()
EndFunc