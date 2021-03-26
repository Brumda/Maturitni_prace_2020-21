extends "res://Scripts/Statemachine/state.gd"

onready var animation = owner.get_node("Body/AnimationPlayer/AnimationTree").get("parameters/playback")
onready var body = owner.get_node("Body")

var velocity = Vector2()

func get_input_direction():
	var input_direction = (int(Input.is_action_pressed("move_right")) 
	- int(Input.is_action_pressed("move_left")))
	
	if Global.lock == false and input_direction != 0:
		body.scale.x = input_direction
	
	return input_direction
	

func update_look_direction(direction):
	if direction and owner.look_direction != direction:
		owner.look_direction = direction
