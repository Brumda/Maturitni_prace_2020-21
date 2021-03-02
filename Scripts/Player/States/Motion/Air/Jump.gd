extends "res://Scripts/Player/States/Motion/motion.gd"


onready var animation = owner.get_node("AnimationPlayer/AnimationTree").get("parameters/playback")

var is_jumping = false
var max_jump_height = -10 * Global.UNIT_SIZE
var horizontal_speed = 0.0
var max_horizontal_speed = 0.0
var base_max_horizontal_speed = 5 * Global.UNIT_SIZE
var velocity = Vector2()
var height = 0


#func initialize(speed):
#	horizontal_speed = speed
#	max_horizontal_speed = speed if speed > 0.0 else base_max_horizontal_speed
	


func enter():
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
#	owner.get_node("AnimationPlayer").play("Jump")
	animation.travel("Jump")


func update(_delta):
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	jump()
	
	if owner.is_on_floor():
		emit_signal("finished", "previous")


func jump():
	if owner.is_on_floor():
		owner.velocity.y = max_jump_height
