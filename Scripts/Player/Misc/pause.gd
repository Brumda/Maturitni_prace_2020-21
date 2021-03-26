extends Control


onready var anim = owner.get_node("Body/AnimationPlayer")
onready var click = owner.get_node("SoundEffects/ButtonCliks")

var dead := false
#You will be able to see your mouse cursor again
func _on_Pause_visibility_changed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


#Function that changes the visibility of the pause menu
func pause():
	var pause = not get_tree().paused
	get_tree().paused = pause
	visible = pause


func _unhandled_input(event: InputEvent) -> void:
	if dead:
		return
	if event.is_action_pressed("pause"):
		pause()


func _on_Resume_pressed():
	click.play()
	yield(click, "finished")
	pause()


func _on_Main_Menu_pressed():
	click.play()
	yield(click, "finished")
	if !dead:
		pause()
	Global.max_lives = 3.0
	Global.more_health = false
	Global.restart = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/User_Interface/MainMenu.tscn")
	


func _on_Restart_pressed():
	click.play()
	yield(click, "finished")
	if !dead:
		pause()
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	Global.restart = true


func _on_Quit_pressed():
	click.play()
	yield(click, "finished")
	get_tree().quit()


func _on_Pause_hide():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func death_screen():
	dead = true
	$VBoxContainer/Resume.disabled = true
	$VBoxContainer/Resume.visible = false
	$Death_note.text = "You died"
	anim.play("Death_menu_fade")

