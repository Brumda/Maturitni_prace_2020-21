extends "res://Scripts/Statemachine/state.gd"


func take_damage(amount):
#	Redirects the information from an area into the state
	owner.lives -= amount
	emit_signal("finished", "hurt")
