extends "res://Scripts/Player/States/Motion/Ground/on_ground.gd"




var max_speed = 5 * Global.UNIT_SIZE
onready var animation = owner.get_node("Body/AnimationPlayer/AnimationTree").get("parameters/playback")


func enter():
	velocity = Vector2()
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	animation.travel("Move")


func handle_input(event):
	return .handle_input(event)


func update(_delta):
	var input_direction = get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")
	update_look_direction(input_direction)
	move(max_speed, input_direction)


func move(speed, direction):
	velocity.y = owner.move_and_slide_with_snap(velocity, Global.snap, Global.UP, 1, 4, deg2rad(20)).y

	velocity.x = lerp(velocity.x, direction * speed, _get_friction())


func _get_friction():
	return 0.2 if owner.is_on_floor() else 1.0

