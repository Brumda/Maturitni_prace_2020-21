extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var GroundRayCast = owner.get_node("Body/GroundRayCast")
onready var body = owner.get_node("Body")
onready var WallRayCast = owner.get_node("Body/WallRayCast")
onready var f_u_note = owner.get_node("Display/Message")

var speed = 2 * Global.UNIT_SIZE
var invert = -1


func enter() -> void:
	f_u_note.text = "What a lovely day!"
	body.scale.x = owner.move_direction
	animation.play("Run")


func update(_delta):
#	The enemy patrols a platform, when he encounters  an edge or a wall
#	he will turn around
	owner.velocity = owner.move_and_slide(owner.velocity, Global.UP)
	owner.velocity.x = lerp(owner.velocity.x, speed * owner.move_direction, .5)
	
	if WallRayCast.is_colliding() or !GroundRayCast.is_colliding() and owner.is_on_floor():
		owner.move_direction *= invert
		body.scale.x *= invert
