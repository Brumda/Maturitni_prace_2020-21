extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer/AnimationTree").get("parameters/playback")
onready var hitbox = owner.get_node("Body/HitBox")
onready var pain_sound = owner.get_node("SoundEffects/Pain")

var dead = 0.0

func enter():
	pain_sound.play()
	hitbox.set_deferred("monitorable", false)
	if owner.lives > dead:
		animation.travel("Hurt")
	
	else:
		emit_signal("finished", "die")


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "Hurt":
		emit_signal("finished", "previous")
		yield(get_tree().create_timer(.4), "timeout")
		hitbox.set_deferred("monitorable", true)
