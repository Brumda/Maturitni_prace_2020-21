extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var GroundRayCast = owner.get_node("Body/GroundRayCast")
onready var body = owner.get_node("Body")
onready var collision = owner.get_node("Collision")
onready var WallRayCast = owner.get_node("Body/WallRayCast")


var speed = 2 * Global.UNIT_SIZE
var invert = -1


func enter() -> void:
	body.scale.x = owner.move_direction
	animation.play("Run")


func update(_delta):
	owner.velocity = owner.move_and_slide(owner.velocity, Global.UP)
	owner.velocity.x = speed * owner.move_direction
	
	if WallRayCast.is_colliding() or !GroundRayCast.is_colliding() and owner.is_on_floor():
		owner.move_direction *= invert
		body.scale.x *= invert
