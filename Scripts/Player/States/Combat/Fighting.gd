extends "res://Scripts/Player/States/Motion/Ground/on_ground.gd"


onready var animation = owner.get_node("Body/AnimationPlayer/AnimationTree").get("parameters/playback")

var max_speed = 5 * Global.UNIT_SIZE
var snap = Vector2(0, Global.UNIT_SIZE)

func enter():
	velocity = Vector2()
	
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	

func update(_delta):
	var input_direction = get_input_direction()
	
	if input_direction == 0:
		animation.travel("Idle")

	else:
		animation.travel("Move")

	move(max_speed, input_direction)

func move(speed, direction):
	velocity.y = owner.move_and_slide_with_snap(velocity, snap, Global.UP, 1, 4, deg2rad(20)).y
	velocity.x = direction * speed
