extends "res://Scripts/Statemachine/state.gd"



onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")

func enter():
	f_u_note.text = "I really dislike you!"
	owner.get_node("HitBox").set_deferred("monitoring", false)
	owner.get_node("HitBox").set_deferred("monitorable", false)
	animation.play("Dying")


func set_dead():
	f_u_note.text = "Mr Stark, I Dont feel so good..."
	owner.get_node("Collision").disabled = true
	owner.set_physics_process(false)


func Mr_Stark_I_Dont_feel_so_good():
	owner.queue_free()
