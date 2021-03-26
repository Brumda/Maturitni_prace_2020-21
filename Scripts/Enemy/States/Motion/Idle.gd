extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")


func enter():
	f_u_note.text = "I'm too old for this anyway"
	animation.play("Idle")


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "Idle":
		emit_signal("finished", "patrol")
