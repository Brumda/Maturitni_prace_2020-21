extends KinematicBody2D

signal grounded_updated(is_grounded)


var max_speed = 5 * Global.UNIT_SIZE
var max_jump_height = -10 * Global.UNIT_SIZE
#Vector2 uses both x and y simultaneously
var velocity = Vector2()
var snap = Vector2(0, Global.UNIT_SIZE)
var jump_duration = 0.5
var is_grounded
var is_attacking = false
var is_jumping = false


func _physics_process(_delta):
		_handle_move_input()
		#function move_and_slide is multiplied by delta by default
		velocity = move_and_slide_with_snap(velocity, snap, Global.UP)
		velocity.y += Global.GRAVITY
		
		
		var was_grounded = is_grounded
		is_grounded = is_on_floor()
		
		
		if was_grounded == null or is_grounded != was_grounded:
			emit_signal("grounded_updated", is_grounded)
		
		
		if is_jumping and velocity.y >=0:
			is_jumping = false
		
		
		_animation()
		
		
		if velocity.y > 1400:
			#If the player is falling for too long, the game restarts the current level
# warning-ignore:return_value_discarded
			get_tree().reload_current_scene()


func _handle_move_input():
	var move_direction = float(-int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right")))
	velocity.x = lerp(velocity.x, max_speed * move_direction, _get_friction())
	if move_direction != 0:
		$Collision.scale.x = move_direction
		$Body.scale.x = move_direction


func _input(event):
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = max_jump_height
		is_jumping = true
	
	if is_jumping == true:
		snap = Vector2()


func _get_friction():
	return 0.2 if is_on_floor() else 0.08


func _animation():
	var anim = "idle"
	
	if !is_on_floor():
		anim = "jump"
	
	elif abs(velocity.x) > Global.UNIT_SIZE:
		anim = "run"
	
	$Body/Sprite.play(anim)


func _on_Player_ready():
	#You won't be able to see the mouse cursor in the game
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
