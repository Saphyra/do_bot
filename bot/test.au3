#include "general/assoc_array.au3"
#include "general/logger.au3"
#include "general/functions.au3"
#include <Array.au3>

Global Const $GUI_CHECKED = 1
Global Const $SETTINGS_INI_FILE = "data/settings.ini"

Global $collection = []

local $count
local $x, $y
For $count = 1 To 1000
   writeLog("Generating coordinates... Attempt: " & $count, $LEVEL_WARN)
   local $result = attempt($collection)
   If $result = False Then
	  writeLog("Clearing collection...", $LEVEL_ERROR)
	  writeLog("Size of collection before clearing: " & UBound($collection), $LEVEL_ERROR)
	  Global $collection = []
   EndIf
Next

Func attempt(ByRef $collection)
   local $try
   For $try = 1 To 10
	  writeLog("Attempting to create a coordinate. Attempt: " & $try, $LEVEL_INFO)
	  $x = Random(0, 100, 1)
	  $y = Random(0, 100, 1)

	  If isAssignable($collection, $x, $y) Then
		 local $coord = $x & "/" & $y
		 writeLog("Coordinates of " & $coord & " is assignable.", $LEVEL_WARN)
		 _ArrayAdd($collection, $coord)
		 Return True
	  EndIf
	  writeLog("Coordinates of " & $x & "/" & $y & " is not assignable.", $LEVEL_ERROR)
   Next

   writeLog("Could not find assignable coordinate out of 10 attempts.", $LEVEL_ERROR)
   return False
EndFunc

Func isAssignable(ByRef $collection, $x, $y)
   local $i
   writeLog("Checking if " & $x & "/" & $y & " is assignable...", $LEVEL_INFO)
   For $i = 0 To UBound($collection) - 1
	  local $coordinate =  $collection[$i]
	  If Not $coordinate Then
		 ContinueLoop
	  EndIf

	  local $splitted = StringSplit($coordinate, "/")
	  local $xCoord = $splitted[1]
	  local $yCoord = $splitted[2]

	  If Abs($xCoord - $x) <= 5 Then
		 writeLog($x & " x is in range.", $LEVEL_DEBUG)
		 If Abs($yCoord - $y) <= 5 Then
			writeLog($x & " y is in range.", $LEVEL_DEBUG)
			Return False
		 EndIf
	  EndIf
   Next

   Return True
EndFunc