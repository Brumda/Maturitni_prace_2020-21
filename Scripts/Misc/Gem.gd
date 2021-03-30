extends Node2D


onready var animation = get_node("AnimationPlayer")

func _ready() -> void:
	animation.play("Wobbling gem")
	Global.gems += 1


func _on_player_entered(_body: Node) -> void:
#	Adds the gem to the player's purse and makes it disappear
	Global.gems_collected += 1
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	animation.play("Fade_away")
	yield(animation, "animation_finished")
	queue_free()
