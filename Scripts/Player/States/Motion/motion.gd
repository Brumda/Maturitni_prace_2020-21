extends "res://Scripts/Statemachine/state.gd"



func get_input_direction():
	var input_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	return input_direction
	

func update_look_direction(direction):
	if direction and owner.look_direction != direction:
		owner.look_direction = direction
