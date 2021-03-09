extends KinematicBody2D


signal direction_changed(new_direction)
signal grounded_updated(is_grounded)

export (float) var lives = 3.0

var look_direction = 1 setget set_look_direction
var is_grounded
var velocity = Vector2()


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
	#You won't be able to see the mouse cursor in the game
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Body/AnimationPlayer/AnimationTree.set_active(true)
