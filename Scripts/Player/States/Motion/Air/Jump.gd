extends "res://Scripts/Player/States/Motion/motion.gd"


var max_jump_height = -11 * Global.UNIT_SIZE
var max_speed = 6 * Global.UNIT_SIZE
var is_jumping = false

func enter():
	velocity = Vector2()
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	animation.travel("Jump")


func update(_delta):
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	jump()
	velocity.x = input_direction * max_speed
	if velocity.y == 0:
		emit_signal("finished", "previous")
	

func jump():
	if owner.is_on_floor():
		is_jumping = true
		owner.velocity.y = max_jump_height
		
	elif !owner.is_on_floor() and is_jumping:
		owner.velocity.y = -0.4 * max_jump_height
		is_jumping = false
