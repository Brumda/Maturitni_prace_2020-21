extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")
onready var attack_hit_detector = owner.get_node("Body/Attack_area")

export (float) var damage = 5

func enter():
	if Global.difficulty == "Easy":
		damage *= 0.66
	
	elif Global.difficulty == "Hard":
		damage *= 1.33
	
	attack_hit_detector.set_deferred("monitoring", true)
	attack_hit_detector.set_deferred("monitorable", true)
	animation.play("Attack")


func _on_Attack_area_area_entered(area: Area2D) -> void:
	area.owner.take_damage(damage)


func _on_animation_finished(anim_name):
	if anim_name == "Attack":
		attack_hit_detector.set_deferred("monitoring", true)
		attack_hit_detector.set_deferred("monitorable", true)
		emit_signal("finished", "previous")
