extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")

func enter():
	
	f_u_note.text = "I really dislike you!"
	
	owner.get_node("Body/HitBox/Collision").set_deferred("disabled", true)
	
	owner.get_node("Body/Player_Detector/See_radius").set_deferred("disabled", true)
	
	owner.get_node("Body/Attack_area/Damage_zone").set_deferred("disabled", true)
	
	animation.play("Dying")


func set_dead():
	f_u_note.text = "Mr Stark, I Dont feel so good..."
	owner.get_node("Collision").set_deferred("disabled", true)


func Mr_Stark_I_Dont_feel_so_good():
	Global.kills += 1
	print("You just killed " + str(Global.kills) + " enemies")
	print("There is this much bad guys herer " + str(Global.enemies_in_room))
	owner.queue_free()
