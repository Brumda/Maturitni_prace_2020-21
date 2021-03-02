extends KinematicBody2D

var velocity = Vector2()
var move_direction = 1
var speed = 2 * Global.UNIT_SIZE
var invert = -1

func _physics_process(_delta):
	velocity.x = speed * move_direction
	velocity.y += Global.GRAVITY
	velocity = move_and_slide(velocity, Global.UP)
	
	$Body/AnimationPlayer.play("Run")
	
	if is_on_wall() or !$RayCast2D.is_colliding() and is_on_floor():
		move_direction *= invert
		scale.x *= invert
