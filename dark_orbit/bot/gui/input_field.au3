Func addInputField()
   local $value = IniRead("data/settings.ini", "test", "name", "NotFound")
   local $id = GUICtrlCreateInput($value, 0, 50, 150, 26)
   GUICtrlSetFont($id, 12)

   return $id
EndFunc

Func addSaveButton()
   local $id = GUICtrlCreateButton("Save", 0, 80)
   GUICtrlSetOnEvent($id, "save")
EndFunc

Func save()
   IniWrite("data/settings.ini", "test", "name", GUICtrlRead($inputFieldId))
EndFunc