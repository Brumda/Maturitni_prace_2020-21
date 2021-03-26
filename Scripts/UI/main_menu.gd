extends Control


onready var popup_menu = $VBoxContainer/Difficulty/Difficulties
onready var difficulty_pointer = $Difficulty
onready var click = $Sounds/ButtonCliks
onready var soundtrack = $Sounds/BasicSoundtrack

func _on_Control_ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	soundtrack.play()


func _process(_delta: float) -> void:
	difficulty_pointer.text = "Difficulty is set to " + Global.difficulty


func _on_Play_pressed():
	click.play()
	yield(click, "finished")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/World/Lvl_01.tscn")


func _on_Difficulty_pressed() -> void:
	click.play()
	popup_menu.visible = not popup_menu.visible


func _on_Easy_pressed() -> void:
	click.play()
	Global.difficulty = "Easy"
	popup_menu.visible = false


func _on_Medium_pressed() -> void:
	click.play()
	Global.difficulty = "Medium"
	popup_menu.visible = false


func _on_Hard_pressed() -> void:
	click.play()
	Global.difficulty = "Hard"
	popup_menu.visible = false


func _on_Tutorial_pressed() -> void:
	click.play()
	yield(click, "finished")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/User_Interface/Tutorial.tscn")


func _on_Quit_pressed():
	click.play()
	yield(click, "finished")
	get_tree().quit()
	
