extends "res://Scripts/Statemachine/state.gd"



func _on_player_entered(_player_body: Node) -> void:
	emit_signal("finished", "chase")
