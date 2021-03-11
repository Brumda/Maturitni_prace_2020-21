extends "res://Scripts/Statemachine/state.gd"


onready var animation = owner.get_node("Body/AnimationPlayer")
onready var f_u_note = owner.get_node("Display/Message")
onready var attack_detector = owner.get_node("Body/Attack_area")


export (float) var damage = 2

func enter():
	if Global.difficulty == "Easy":
		damage *= 0.75
	
	elif Global.difficulty == "Hard":
		damage *= 1.5
	
	animation.play("Attack")


func _on_Attack_area_area_entered(area: Area2D) -> void:
	area.owner.take_damage(damage)


func _on_animation_finished(anim_name):
	if anim_name == "Attack":
		yield(get_tree().create_timer(0.5), "timeout")
		attack_detector.set_deferred("monitoring", false)
		attack_detector.set_deferred("monitoring", true)
		emit_signal("finished", "previous")
