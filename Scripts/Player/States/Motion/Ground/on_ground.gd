extends "res://Scripts/Player/States/Motion/motion.gd"


func handle_input(event):
	if Global.lock:
		return
	
	if event.is_action_pressed("jump"):
		emit_signal("finished", "jump")
