extends "res://Scripts/Player/States/Motion/Ground/on_ground.gd"


func enter():
	animation.travel("Idle")


func update(_delta):
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
