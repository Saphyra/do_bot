Global Const $BONUS_BOX_FILE = getFilePath("bonus_box")

Global Const $BBX1 = 100
Global Const $BBY1 = 100
Global Const $BBX2 = @DesktopWidth - 100
Global Const $BBY2 = @DesktopHeight - 100

Func collectBox()
   writeLog("Collecting bonus boxes near the target position...", $LEVEL_INFO)
   local $x, $y
   local $lastX = 0, $lastY = 0
   local $i

   For $i = 1 To 3
	  If Not _ImageSearchArea($BONUS_BOX_FILE, 1, $BBX1, $BBY1, $BBX2, $BBY2, $x, $y, 20) Then
		 writeLog("No boxes found in the search area.", $LEVEL_INFO)
		 ExitLoop
	  EndIf
	  writeLog("Bonus box found at " & $x & "/" & $y, $LEVEL_INFO)
	  If $x = $lastX And $y = $lastY Then
		 writeLog("Ship stucked during collecting boxes at " & $x & "/" & $y, $LEVEL_WARN)
		 ExitLoop
	  EndIf
	  Click($x, $y)

	  $lastX = $x
	  $lastY = $y

	  Sleep(200)
	  idleTillMove(False)
	  Sleep(200)
   Next

   writeLog("No more bonus boxes in the search area.", $LEVEL_INFO)
EndFunc

func searchForBonusBox()
   local $x, $y
   if _ImageSearchArea($BONUS_BOX_FILE, 1, $BBX1, $BBY1, $BBX2, $BBY2, $x, $y, 20) Then
	  writeLog("Bonus box found at " & $x & "/" & $y, $LEVEL_INFO)
	  Sleep(500)
	  Click($x, $y)
	  idleTillMove(False)
	  Return True
   EndIf
   Return False
EndFunc