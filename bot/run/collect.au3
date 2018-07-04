Global Const $BONUS_BOX_FILE = getFilePath("bonus_box")

Global Const $BBX1 = 100
Global Const $BBY1 = 100
Global Const $BBX2 = @DesktopWidth - 100
Global Const $BBY2 = @DesktopHeight - 100

Func collectBox()
   local $x, $y
   local $lastX = 0, $lastY = 0
   While _ImageSearchArea($BONUS_BOX_FILE, 1, $BBX1, $BBY1, $BBX2, $BBY2, $x, $y, 50)
	  If $x = $lastX And $y = $lastY Then
		 ExitLoop
	  EndIf
	  Click($x, $y)

	  $lastX = $x
	  $lastY = $y

	  Sleep(500)
	  idleTillMove()
   WEnd
EndFunc