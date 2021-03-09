extends "res://Scripts/Statemachine/state.gd"

onready var animation = owner.get_node("Body/AnimationPlayer")
onready var RayCast = owner.get_node("Body/RayCast")
onready var body = owner.get_node("Body")

var speed = 2 * Global.UNIT_SIZE
#var move_direction = 1
var invert = -1


func enter() -> void:
	animation.play("Run")


func update(_delta):
	owner.velocity.x = speed * owner.move_direction
	owner.velocity = owner.move_and_slide(owner.velocity, Global.UP)
	
	
	if owner.is_on_wall() or !RayCast.is_colliding() and owner.is_on_floor():
		owner.move_direction *= invert
		body.scale.x *= invert
