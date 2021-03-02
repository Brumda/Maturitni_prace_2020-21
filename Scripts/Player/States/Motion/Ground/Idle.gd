extends "res://Scripts/Player/States/Motion/Ground/on_ground.gd"


onready var animation = owner.get_node("AnimationPlayer/AnimationTree").get("parameters/playback")

func enter():
#	owner.get_node("AnimationPlayer").play("Idle")
	animation.travel("Idle")

func handle_input(event):
	return .handle_input(event)


func update(_delta):
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
