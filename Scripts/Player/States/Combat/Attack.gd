extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer/AnimationTree").get("parameters/playback")

#	Most of the attack is happening in the weapon script
func enter():
	animation.travel("Attack")


func _on_attack_finished():
	emit_signal("finished", "previous")
