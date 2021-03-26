extends "res://Scripts/Player/States/Motion/Ground/on_ground.gd"


onready var steps = owner.get_node("SoundEffects/FootSteps")

var max_speed = 6 * Global.UNIT_SIZE
var snap = Vector2(0, Global.UNIT_SIZE)
var steps_on

func enter():
	velocity = Vector2()
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	steps.play()
	animation.travel("Move")


func handle_input(event):
	return .handle_input(event)


func update(_delta):
	if  !steps.is_playing() and owner.is_on_floor():
		steps.play()
	elif steps.is_playing() and !owner.is_on_floor():
		steps.stop()
	
	var input_direction = get_input_direction()
	if not input_direction:
		steps.stop()
		emit_signal("finished", "idle")
	update_look_direction(input_direction)
	move(max_speed, input_direction)


func move(speed, direction):
	velocity.y = owner.move_and_slide_with_snap(velocity, snap, Global.UP, 1, 4, deg2rad(20)).y
	if Global.lock and direction != body.scale.x:
		velocity.x = lerp(velocity.x, direction * speed * .5, 0.2)
	
	else:
		velocity.x = lerp(velocity.x, direction * speed, 0.2)
