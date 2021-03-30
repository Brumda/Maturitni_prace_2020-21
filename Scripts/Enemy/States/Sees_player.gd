extends "res://Scripts/Statemachine/state.gd"



func _on_player_entered(_player_body: Node) -> void:
#	Redirects the information from an area into the state
	emit_signal("finished", "chase")
