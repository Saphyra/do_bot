Func startBot()
   $scriptState = $STATE_RUN
   MsgBox(0, "Running...", "The bot started", 5)

   HotKeySet("{ESC}", "idle")
EndFunc