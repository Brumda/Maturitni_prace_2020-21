extends "res://Scripts/Statemachine/state.gd"



func take_damage(amount):
	owner.lives -= amount
	emit_signal("finished", "hurt")
