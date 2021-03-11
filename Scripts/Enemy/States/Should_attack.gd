extends "res://Scripts/Statemachine/state.gd"



func _on_player_in_attack_range(_body: Node) -> void:
	emit_signal("finished", "attack")
