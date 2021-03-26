extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")
onready var attack_detector = owner.get_node("Body/Attack_area")
onready var vision = owner.get_node("Body/Player_Detector")

#var attack_damage = owner.damage

var killed_player := false

func enter():
	f_u_note.text = "You're even uglier up close"
	if Global.difficulty == "Easy":
		owner.damage *= 0.75
	
	elif Global.difficulty == "Hard":
		owner.damage *= 1.5
	
	animation.play("Attack")


func _on_Attack_area_area_entered(area: Area2D) -> void:
	yield(get_tree().create_timer(0.2), "timeout")
	area.owner.take_damage(owner.damage)
	if area.owner.lives <= 0:
		killed_player = true


func _on_animation_finished(anim_name):
	if anim_name == "Attack" and !Global.player_is_dead:
		yield(get_tree().create_timer(0.5), "timeout")
		attack_detector.set_deferred("monitoring", false)
		attack_detector.set_deferred("monitoring", true)
		emit_signal("finished", "previous")
	
	elif killed_player:
		emit_signal("finished", "celebrating")
