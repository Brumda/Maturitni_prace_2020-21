extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var body = owner.get_node("Body")
onready var RayCast = owner.get_node("Body/RayCast")

var reaction_time = 500
var direction = 0
#var owner.move_direction = 0
var next_direction_time = 0
var next_jump_time = -1
var speed = 3 * Global.UNIT_SIZE
var player = null


func enter():
	animation.play("Run")
	

func set_direction(target_direction):
	if owner.move_direction != target_direction:
		owner.move_direction = target_direction
		next_direction_time = OS.get_ticks_msec() + reaction_time
		yield(get_tree().create_timer(0.4), "timeout")
		body.scale.x *= -1

func update(_delta):
	owner.velocity = owner.move_and_slide(owner.velocity, Global.UP)
	
	if player.position.x < owner.position.x:
		set_direction(-1)

	elif player.position.x > owner.position.x:
		set_direction(1)

	if OS.get_ticks_msec() > next_direction_time:
		direction = owner.move_direction
	
#	if !RayCast.is_colliding() or owner.is_on_wall():
#		emit_signal("finished", "previous")
		
	owner.velocity.x = speed * direction



func _on_PlayerDetector_body_entered(player_body: Node) -> void:
	player = player_body


func _on_PlayerDetector_body_exited(_body: Node):
	emit_signal("finished", "previous")
