extends KinematicBody2D


export (int) var move_direction = 1
export (float) var lives = 5.0
export (float) var damage = 2.0

var velocity = Vector2()

func _ready() -> void:
	Global.enemies_in_room += 1
	if Global.difficulty == "Easy":
		lives *= 0.75
	
	elif Global.difficulty == "Hard":
		lives *= 1.5
	
	
func _physics_process(_delta):
	velocity.y += Global.GRAVITY


func take_damage(amount):
	$StateMachine/Got_hit.take_damage(amount)
