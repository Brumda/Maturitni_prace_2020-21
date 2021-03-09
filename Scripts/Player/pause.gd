extends Control

#You will be able to see your mouse cursor again
func _on_Pause_visibility_changed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


#Function that changes the visibility of the pause menu
func pause():
	var pause = not get_tree().paused
	get_tree().paused = pause
	visible = pause


func _input(event):
	if event.is_action_pressed("pause"):
		pause()


func _on_Resume_pressed():
	pause()


func _on_Main_Menu_pressed():
	pause()
# warning-ignore:return_value_discarded

	get_tree().change_scene("res://Scenes/User_Interface/MainMenu.tscn")



func _on_Restart_pressed():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	#If you restart, you will lose your progress
	Global.key_parts = 0
	pause()


func _on_Quit_pressed():
	get_tree().quit()


func _on_Pause_hide():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
