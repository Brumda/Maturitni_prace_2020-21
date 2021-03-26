extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var body = owner.get_node("Body")
onready var GroundRayCast = owner.get_node("Body/GroundRayCast")
onready var WallRayCast = owner.get_node("Body/WallRayCast")
onready var f_u_note = owner.get_node("Display/Message")

var player = null

var reaction_time = 500
var direction = 0
var next_direction_time = 0
var next_jump_time = -1
var speed = 3 * Global.UNIT_SIZE
var max_jump_height = -6 * Global.UNIT_SIZE

func enter():
	f_u_note.text = "Sir! Let me tell you about Raid shadow legends!"
	if Global.difficulty == "Easy":
		reaction_time *= 1.33
	
	elif Global.difficulty == "Hard":
		reaction_time *= 0.66
	
	animation.play("Run")
	

func set_direction(target_direction):
	if owner.move_direction != target_direction:
		owner.move_direction = target_direction
		
		next_direction_time = OS.get_ticks_msec() + reaction_time
		
		yield(get_tree().create_timer(0.1), "timeout")
		
		body.scale.x *= -1


func update(_delta):
	owner.velocity = owner.move_and_slide(owner.velocity, Global.UP)
	follow_on_platform()
	if Global.difficulty == "Hard":
		jumps_after_you()


func follow_on_platform():
	if player.position.x < owner.position.x:
		set_direction(-1)
	
	elif player.position.x > owner.position.x:
		set_direction(1)
	
	if OS.get_ticks_msec() > next_direction_time:
		direction = owner.move_direction
	
	if Global.difficulty != "Hard":
		if !GroundRayCast.is_colliding() or WallRayCast.is_colliding():
			emit_signal("finished", "idle")
	
	owner.velocity.x = lerp(owner.velocity.x, speed * direction, .3)


func jumps_after_you():
	if OS.get_ticks_msec() > next_jump_time and next_jump_time != -1 and owner.is_on_floor() or !GroundRayCast.is_colliding():
		if player.position.y < owner.position.y - 20:
			owner.velocity.y = max_jump_height
		
		next_jump_time = -1
	
	if player.position.y < owner.position.y and next_jump_time == -1:
		next_jump_time = OS.get_ticks_msec() + reaction_time


func _on_Player_Detector_body_entered(player_body: Node) -> void:
		player = player_body


func _on_Player_Detector_body_exited(_body: Node):
	emit_signal("finished", "previous")
