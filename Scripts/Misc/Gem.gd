extends Node2D


onready var animation = get_node("AnimationPlayer")

func _ready() -> void:
	animation.play("Wobbling gem")
	Global.gems += 1


func _on_player_entered(_body: Node) -> void:
	Global.gems_collected += 1
	animation.play("Fade_away")
	yield(animation, "animation_finished")
	queue_free()
