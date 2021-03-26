extends Area2D


signal attack_finished

onready var animation =  $AnimationPlayer


var damage = 3
enum States {IDLE, ATTACK}
var state = null

var ready_for_next_attack = false

var attack_current = {}
var combo = [
	{
		"damage": damage,
		"animation": "Swing"}
	]


func _ready():
	_change_state(States.IDLE)


func _change_state(new_state):
	match state:
		States.ATTACK:
			ready_for_next_attack = false

	match new_state:
		States.IDLE:
			animation.stop()
			set_deferred("visible", false)
			set_deferred("monitoring", false)
			set_deferred("monitorable", false)
		
		States.ATTACK:
			attack_current = combo[0]
			animation.play(attack_current["animation"])
			set_deferred("visible", true)
			set_deferred("monitoring", true)
			set_deferred("monitorable", true)
	
	state = new_state


func _unhandled_input(event):
	if not state == States.ATTACK:
		return

	if event.is_action_pressed("attack") and !ready_for_next_attack:
		return


func attack():
	_change_state(States.ATTACK)


func set_ready_for_next_attack():
	ready_for_next_attack = true


func _on_animation_finished(_anim_name):
	_change_state(States.IDLE)
	emit_signal("attack_finished")


func _on_StateMachine_state_changed(current_state):
	if current_state.name == "Attack":
		attack()
	
	else:
		_change_state(States.IDLE)


func _on_enemy_hit(area: Area2D) -> void:
	set_deferred("monitorable", false)
	set_deferred("monitoring", false)
	area.owner.take_damage(attack_current["damage"])
