Func idleStillMove()
   While isMove() = True
	  Sleep(500)
   WEnd
EndFunc

Func isMove()
   local $file = getFilePath("mini_map_no_move")
   local $x, $y
   local $result =  _ImageSearchArea($file, 0, $ix1, $iy1, $ix2, $iy2, $x, $y, 50)

   if $moveStarted + 60 < getTimeStamp() Then
	  return False
   EndIf

   return $result = 0
EndFunc