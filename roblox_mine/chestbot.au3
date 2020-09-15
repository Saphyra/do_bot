#include <MsgBoxConstants.au3>

HotKeySet("{F1}", "getChestPos")
HotKeySet("{F2}", "getChestTabPos")
HotKeySet("{F3}", "start")
HotKeySet("{F4}", "pause")
HotKeySet("{ESC}", "stop")

Global $cx = 0
Global $cy = 0
Global $tx = 0;
Global $ty = 0;
Global $counter = 0

MsgBox(0, "Started", "Bot staretd.", 2)

idle()

Func getChestPos()
   local $pos = MouseGetPos()
   $cx = $pos[0]
   $cy = $pos[1]

   MsgBox(0, "Captured coordinates", "x: " & $cx & " / y: " & $cy, 2)
EndFunc

Func getChestTabPos()
   local $pos = MouseGetPos()
   $tx = $pos[0]
   $ty = $pos[1]

   MsgBox(0, "Captured coordinates", "x: " & $tx & " / y: " & $ty, 2)
EndFunc

Func idle()
   While True
	  Sleep(10000)
   WEnd
EndFunc

Func start()
   While true
	  MouseClick("left", Random($tx - 10, $tx + 10), Random($ty - 10, $ty + 10))
	  Sleep(500)
	  MouseMove(Random($cx - 25, $cx + 25), Random($cy - 25, $cy + 25))
	  MouseDown("left")
	  Sleep(500)
	  MouseUp("left")
	  $counter = $counter + 1
	  Sleep(7000)
   WEnd
EndFunc

Func pause()
   MsgBox(0, "Paused", "Paused...")
   idle()
EndFunc

Func stop()
   MsgBox(0, "Exiting", "Opened chests: " & $counter, 2)
   Exit
EndFunc