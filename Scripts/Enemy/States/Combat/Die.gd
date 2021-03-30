extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")
onready var death_sound = owner.get_node("SoundEffects/Death")
onready var level_done = owner.get_node("SoundEffects/LastEnemy")

func enter():
#	Disables all the areas
	f_u_note.text = "Wow, that was mean..."
	death_sound.play()
	owner.get_node("Body/HitBox/Collision").set_deferred("disabled", true)
	
	owner.get_node("Body/Player_Detector/Vision").set_deferred("disabled", true)
	
	owner.get_node("Body/Attack_area/Damage_zone").set_deferred("disabled", true)
	
	animation.play("Dying")


func set_dead():
	f_u_note.text = "Mr Stark, I Dont feel so good..."
	owner.get_node("Collision").set_deferred("disabled", true)


func Mr_Stark_I_Dont_feel_so_good():
#	Removes the enemy after death
	Global.kills += 1
	if Global.kills == Global.enemies_in_room:
		Global.change_soundtrack = true
		level_done.play()
		yield(level_done, "finished")
	owner.queue_free()

func attitude_gone():
	f_u_note = ""
