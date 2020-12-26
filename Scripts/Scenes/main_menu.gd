extends Control


func _on_Control_ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/world.tscn")


func _on_Quit_pressed():
	get_tree().quit()
