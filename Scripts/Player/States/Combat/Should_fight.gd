extends "res://Scripts/Player/States/Motion/Ground/on_ground.gd"



func _on_Fighting_zone_body_entered(_body: Node) -> void:
	emit_signal("finished", "fighting")


func _on_Fighting_zone_body_exited(_body: Node) -> void:
	emit_signal("finished", "move")
