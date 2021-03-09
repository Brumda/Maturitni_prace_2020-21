extends KinematicBody2D
class_name enemy


export (int) var move_direction = 1

export (float) var lives = 10.0


var velocity = Vector2()

func _ready() -> void:
	if Global.difficulty == "Easy":
		lives *= 0.66
	
	elif Global.difficulty == "Hard":
		lives *= 1.33
	
	
func _physics_process(_delta):
	velocity.y += Global.GRAVITY

func take_damage(amount):
	$StateMachine/Got_hit.take_damage(amount)

