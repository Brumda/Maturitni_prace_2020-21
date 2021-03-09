extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer/AnimationTree").get("parameters/playback")

var dead = 0.0


func enter():
	if owner.lives > dead:
		animation.travel("Hurt")
	
	else:
		emit_signal("finished", "die")




func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "Hurt":
		emit_signal("finished", "previous")
