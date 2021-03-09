extends "res://Scripts/Statemachine/state.gd"



func _on_Should_Attack_detector_body_entered(_body: Node) -> void:
	emit_signal("finished", "attack")
