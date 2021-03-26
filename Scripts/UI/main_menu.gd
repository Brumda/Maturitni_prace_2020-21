extends Control


onready var popup_menu = $VBoxContainer/Difficulty/Difficulties
onready var difficulty_pointer = $Difficulty


func _on_Control_ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _process(_delta: float) -> void:
	difficulty_pointer.text = "Difficulty is set to " + Global.difficulty


func _on_Play_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/World/Lvl_01.tscn")


func _on_Difficulty_pressed() -> void:
	popup_menu.visible = not popup_menu.visible


func _on_Easy_pressed() -> void:
	Global.difficulty = "Easy"
	popup_menu.visible = false


func _on_Medium_pressed() -> void:
	Global.difficulty = "Medium"
	popup_menu.visible = false


func _on_Hard_pressed() -> void:
	Global.difficulty = "Hard"
	popup_menu.visible = false


func _on_Tutorial_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/User_Interface/Tutorial.tscn")


func _on_Quit_pressed():
	get_tree().quit()
