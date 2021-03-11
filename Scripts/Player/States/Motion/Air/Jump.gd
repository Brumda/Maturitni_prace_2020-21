extends "res://Scripts/Player/States/Motion/motion.gd"



onready var animation = owner.get_node("Body/AnimationPlayer/AnimationTree").get("parameters/playback")

var max_jump_height = -11 * Global.UNIT_SIZE
var velocity = Vector2()
var is_jumping = false

func enter():
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	animation.travel("Jump")


func update(_delta):
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	jump()
	
	if velocity.y <= 0:
		emit_signal("finished", "previous")


func jump():
	if owner.is_on_floor():
		is_jumping = true
		owner.velocity.y = max_jump_height
		
	elif !owner.is_on_floor() and is_jumping:
		owner.velocity.y = -0.4 * max_jump_height
		is_jumping = false
	
