extends Area2D


onready var animation = $AnimationPlayer
onready var hint = $Hint
onready var hum = $Humming

export var next_scene : PackedScene
var can_teleport
var teleported
var player_gone

func _process(_delta: float) -> void:
#	Activates the portal
	if (Global.kills == Global.enemies_in_room and !teleported
	 and !can_teleport and !Global.player_is_dead):
		can_teleport = true
		hum.play()
		animation.play("Spin_me_right_round_baby")


func transition():
#	Teleports player into next level after black screen fade out
	can_teleport = false
	animation.play("TransitionFading")
	yield(animation, "animation_finished")
	
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(next_scene)


func _on_player_entered(_body: Node) -> void:
#	Hints based on the player's progress
	if can_teleport and Global.gems_collected == Global.gems:
		hint.text = "Press X to teleport into the next level"
	
	elif can_teleport and Global.gems_collected != Global.gems:
		hint.text = "You don't have all the gems yet. If that doesn't bother you, \nyou can press X to teleport into the next level"
	
	else:
		hint.text = "There are still enemies you need to get rid of before going forward!"


func _on_player_exited(_body: Node) -> void:
	if player_gone:
		return
	yield(get_tree().create_timer(4), "timeout")
	if hint.text:
		hint.text = ""


func _unhandled_input(event: InputEvent) -> void:
#	Waiting until the player wants to teleport
	if event.is_action_pressed("teleport") and can_teleport:
		teleported = true
		transition()


func _on_Portal_tree_exiting() -> void:
	player_gone = true
