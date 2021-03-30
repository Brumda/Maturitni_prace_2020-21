extends KinematicBody2D

#	Base enemy script
export (int) var move_direction = 1
export (float) var lives = 50
export (float) var damage = 20

var velocity = Vector2()

func _ready() -> void:
#	Changes values based on difficulty
	Global.enemies_in_room += 1
	if Global.difficulty == "Easy":
		lives *= 0.75
		damage *= 0.75
		
	elif Global.difficulty == "Hard":
		lives *= 1.5
		damage *= 1.5
	
	
func _physics_process(_delta):
	velocity.y += Global.GRAVITY


func take_damage(amount):
	$StateMachine/Got_hit.take_damage(amount)
