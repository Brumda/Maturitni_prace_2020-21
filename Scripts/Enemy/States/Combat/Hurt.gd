extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")

var dead = 0.0


func enter():
#	Enemy is deciding if he is going to make it or not
	f_u_note.text = "Ouch!"
	
	if owner.lives > dead:
		animation.play("Hurt")
	
	else:
		emit_signal("finished", "die")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "Hurt":
		emit_signal("finished", "previous")
