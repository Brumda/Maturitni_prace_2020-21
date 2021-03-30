extends Control


onready var click = $Sounds/ButtonCliks
onready var win = $Sounds/Win

func _on_Control_ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	win.play()


func _on_MainMenu_pressed():
#	Restarts game progress
	click.play()
	yield(click, "finished")
	Global.max_lives = 30
	Global.more_health = false
	Global.restart = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/User_Interface/MainMenu.tscn")


func _on_Quit_pressed():
	click.play()
	yield(click, "finished")
	get_tree().quit()
