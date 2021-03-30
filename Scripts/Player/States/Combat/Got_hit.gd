extends "res://Scripts/Statemachine/state.gd"


func take_damage(amount):
#	Subtracks players lifes
	owner.lives -= amount
	emit_signal("finished", "hurt")
