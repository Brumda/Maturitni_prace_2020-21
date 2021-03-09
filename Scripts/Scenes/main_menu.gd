extends Control


func _on_Control_ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Play_pressed():

# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/World/Lvl_01.tscn")



func _on_Quit_pressed():
	get_tree().quit()
