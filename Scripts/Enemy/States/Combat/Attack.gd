extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")
onready var attack_detector = owner.get_node("Body/Attack_area")
onready var vision = owner.get_node("Body/Player_Detector")

var killed_player := false

func enter():
	f_u_note.text = "You're even uglier up close"
	
	animation.play("Attack")


func _on_Attack_area_area_entered(area: Area2D) -> void:
#	Won't attack if either player or himself are dead
	yield(get_tree().create_timer(0.2), "timeout")
	if Global.player_is_dead:
		return
	if owner.lives <= 0:
		return
#	Redirects the damage into the take_damage function
#	inside the player controller
	area.owner.take_damage(owner.damage)
	if area.owner.lives <= 0:
		killed_player = true


func _on_animation_finished(anim_name):
	if anim_name == "Attack" and !Global.player_is_dead:
#	Quickly turns off and on again the attack area so
#	the player cannot hide inside forever
		yield(get_tree().create_timer(0.5), "timeout")
		attack_detector.set_deferred("monitoring", false)
		attack_detector.set_deferred("monitoring", true)
		emit_signal("finished", "previous")
	
	elif killed_player:
#	Celebrates
		emit_signal("finished", "celebrating")
