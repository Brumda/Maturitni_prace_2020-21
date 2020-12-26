extends KinematicBody2D

var velocity = Vector2()
var direction = 1
var speed = 2 * 48

func _physics_process(delta):
	velocity.x = speed * direction
	velocity.y += Global.GRAVITY
	velocity = move_and_slide(velocity, Global.UP)
	
	$Sprite.play("Run")
	
	if is_on_wall():
		direction *= -1
		$RayCast2D.position.x *= -1
		$Sprite.flip_h = !$Sprite.flip_h
		
		
	if $RayCast2D.is_colliding() == false:
		direction *= -1
		$RayCast2D.position.x *= -1
		$Sprite.flip_h = !$Sprite.flip_h
	
