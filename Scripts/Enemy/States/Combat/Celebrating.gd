extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")


func enter():
	f_u_note.text = "Theseus said this was a challenge"
	animation.play("Celebrating")
