extends "res://Scripts/Statemachine/state.gd"



func _on_player_in_attack_range(_body: Node) -> void:
#	Redirects the information from an area into the state
	emit_signal("finished", "attack")
