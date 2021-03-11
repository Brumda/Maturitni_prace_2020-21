extends KinematicBody2D


signal direction_changed(new_direction)
signal grounded_updated(is_grounded)

export (float) var max_lives = 3.0
var lives = max_lives

var look_direction = 1 setget set_look_direction
var is_grounded
var velocity = Vector2()
var more_health = false


func _physics_process(_delta):
	velocity.y = move_and_slide(velocity, Global.UP, 1).y
	velocity.y += Global.GRAVITY
	
	var was_grounded = is_grounded
	is_grounded = is_on_floor()
	
	if was_grounded == null or is_grounded != was_grounded:
		emit_signal("grounded_updated", is_grounded)
	
	if velocity.y > 1400:
#If the player is falling for too long, the game restarts the current level
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()


func take_damage(amount):
	$StateMachine/Got_hit.take_damage(amount)


func set_look_direction(value):
	look_direction = value
	$Body.scale.x *= -1
	emit_signal("direction_changed", value)


func _on_Player_ready():
	Global.gems_collected = 0
	Global.kills = 0
	Global.gems = 0
	Global.enemies_in_room = 0
	#You won't be able to see the mouse cursor in the game
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Body/AnimationPlayer/AnimationTree.set_active(true)


func _on_gem_collected(_area: Area2D) -> void:
	if Global.gems == Global.gems_collected and !more_health:
		max_lives += 1
		lives += 1
	
	if lives < max_lives:
		lives += 0.5
