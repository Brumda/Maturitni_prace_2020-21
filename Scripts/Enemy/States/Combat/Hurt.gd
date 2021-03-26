extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")
onready var pain_sound = owner.get_node("SoundEffects/Pain")

var dead = 0.0

func enter():
	f_u_note.text = "Hey! Be careful with that thing!"
#	Enemy is deciding if he is going to make it or not
	if owner.lives > dead:
		pain_sound.play()
		animation.play("Hurt")
	
	else:
		emit_signal("finished", "die")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "Hurt":
		emit_signal("finished", "previous")
