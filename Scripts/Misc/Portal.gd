extends Area2D


onready var animation = $AnimationPlayer
onready var hint = $Hint

export var next_scene : PackedScene
var can_teleport

func _ready() -> void:
	animation.play("Spin me round around")


func transition():
	can_teleport = false
	animation.play("TransitionFading")
	yield(animation, "animation_finished")
	
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(next_scene)


func _on_player_entered(_body: Node) -> void:
		if Global.kills == Global.enemies_in_room and Global.gems_collected == Global.gems:
			hint.text = "Press X to teleport into the next level"
			can_teleport = true
		
		elif Global.kills == Global.enemies_in_room and Global.gems_collected != Global.gems:
			hint.text = "You don't have all the gems yet. If that doesn't bother you, \nyou can press X to teleport into the next level"
			can_teleport = true
		
		else:
			hint.text = "There are still enemies you need to get rid of before going forward!"


func _on_player_exited(_body: Node) -> void:
	if can_teleport == false:
		return
	
	can_teleport = false
	yield(get_tree().create_timer(5), "timeout")
	hint.text = ""


func _input(event: InputEvent):
	if event.is_action_pressed("teleport") and can_teleport:
		transition()
