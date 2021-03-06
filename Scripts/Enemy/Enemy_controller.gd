extends KinematicBody2D
class_name enemy


var move_direction = 1
export (float) var lives = 10


var velocity = Vector2()


func _physics_process(_delta):
	velocity.y += Global.GRAVITY

func take_damage(amount):
	$StateMachine/Got_hit.take_damage(amount)

