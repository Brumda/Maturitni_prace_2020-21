extends Area2D


signal attack_finished

export(int) var Damadge = 3

enum States {IDLE, ATTACK}
var state = null
var ready_for_next_attack = false

const MAX_COMBO_COUNT = 3

var combo_count = 0

var attack_current = {}
var combo = [{
		"damage": 1,
		"animation": "Swing"
	},
	{
		"damage": 1,
		"animation": "Swing"
	},
	{
		"damage": 3,
		"animation": "Swing"
	}]


func _ready():
# warning-ignore:return_value_discarded
	$AnimationPlayer.connect("animation_finished", self, "_on_animation_finished")
	
#	self.connect("body_entered", self, "_on_body_entered")
#	$AnimationPlayer.play(States.IDLE)
	_change_state(States.IDLE)


func _change_state(new_state):
	match state:
		States.ATTACK:
#			attack_input_state = AttackInputStates.LISTENING
			ready_for_next_attack = false

	match new_state:
		States.IDLE:
			combo_count = 0
			$AnimationPlayer.stop()
			visible = false
			monitoring = false
		
		States.ATTACK:
			attack_current = combo[combo_count -1]
			$AnimationPlayer.play(attack_current["animation"])
			visible = true
			monitoring = true
	
	state = new_state


func _physics_process(_delta):
	if ready_for_next_attack:
		attack()


func attack():
	combo_count += 1
	_change_state(States.ATTACK)


func set_ready_for_next_attack():
	ready_for_next_attack = true

func _on_animation_finished(_name):
	_change_state(States.IDLE)
	emit_signal("attack_finished")


func _on_StateMachine_state_changed(current_state):
	if current_state.name == "Attack":
		attack()
