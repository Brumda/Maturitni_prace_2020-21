extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")


func enter():
	animation.play("Idle")


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "Idle":
		emit_signal("finished", "patrol")
