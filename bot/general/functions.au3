Func Click($x, $y)
   MouseClick("left", $x, $y, 1, 0)
   MouseMove(0, 0, 0)
EndFunc

Func close()
   Exit
EndFunc

Func getFilePath($name)
   return IniRead("data/files.ini", "files", $name, 0)
EndFunc

Func getIndentation($source, $defaultLength, $indentChar = " ", $indentNum = 4)
   local $result = ""
   local $sourceLength = StringLen($source)

   local $x
   For $x = 0 To $defaultLength - $sourceLength + $indentNum
	  $result = $result & $indentChar
   Next

   Return $result
EndFunc

Func getMilliSeconds()
    Local $stSystemTime = DllStructCreate('ushort;ushort;ushort;ushort;ushort;ushort;ushort;ushort')
    DllCall('kernel32.dll', 'none', 'GetSystemTime', 'ptr', DllStructGetPtr($stSystemTime))

    $sMilliSeconds = StringFormat('%03d', DllStructGetData($stSystemTime, 8))

    $stSystemTime = 0

    Return $sMilliSeconds
EndFunc

Func getTime()
   Return @YEAR & "-" & @MON & "-" & @MDAY & " - " & @HOUR & ":" & @MIN & ":" & @SEC & "." & getMilliSeconds()
EndFunc

Func getTimeStamp()
   return @HOUR * 3600 + @MIN * 60 + @SEC
EndFunc

