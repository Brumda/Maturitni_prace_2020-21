extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer/AnimationTree").get("parameters/playback")
onready var dead = owner.get_node("Pause/Pause")
onready var soundtrack = owner.get_node("SoundEffects/BasicSoundtrack")
onready var soundtrack_enemies = owner.get_node("SoundEffects/Soundtrack_enemies")
onready var steps = owner.get_node("SoundEffects/FootSteps")
onready var death_sound =  owner.get_node("SoundEffects/Death")

func enter():
	soundtrack_enemies.stop()
	soundtrack.stop()
	steps.stop()
	death_sound.play()
	Global.player_is_dead = true
	owner.get_node("Body/HitBox").set_deferred("monitorable", false)
	Global.restart = true
	animation.travel("Dying")


func _on_animation_finished(anim_name):
	if anim_name == "Dying" and Global.player_is_dead:
		Global.player_is_dead = false
		dead.death_screen()
