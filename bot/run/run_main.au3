Func startBot()
   GUISetState(@SW_HIDE, $mainWindowId)
   $scriptState = $STATE_RUN
   MsgBox(0, "Running...", "The bot started", 5)

   HotKeySet("{ESC}", "returnToGui")
EndFunc