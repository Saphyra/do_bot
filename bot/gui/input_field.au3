Func addInputField()
   local $value = IniRead("data/settings.ini", "test", "name", "NotFound")
   local $id = GUICtrlCreateInput($value, 0, 0, 70, 20)

   return $id
EndFunc

Func addSaveButton()
   local $id = GUICtrlCreateButton("Save", 0, 30)
   GUICtrlSetOnEvent($id, "save")
EndFunc

Func save()
   IniWrite("data/settings.ini", "test", "name", GUICtrlRead($inputFieldId))
EndFunc