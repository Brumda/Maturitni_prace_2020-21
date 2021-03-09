extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer/AnimationTree").get("parameters/playback")



func enter():
	owner.get_node("Body/HitBox/Collision").set_deferred("disabled", true)
	
	owner.get_node("Body/Fighting_zone/Collision").set_deferred("disabled", true)
	
	animation.travel("Dying")


func _on_animation_finished(anim_name):
	if anim_name == "Dying":
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/User_Interface/MainMenu.tscn")
