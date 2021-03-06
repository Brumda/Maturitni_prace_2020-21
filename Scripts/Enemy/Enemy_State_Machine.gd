extends "res://Scripts/Statemachine/state_machine.gd"


onready var patrol = $Patrol
onready var chase = $Chase
#onready var attack = $Attack
onready var hurt = $Hurt
onready var die = $Die




func _ready():
	states_map = {
		"patrol": patrol,
		"chase": chase,
#		"attack": attack,
		"hurt": hurt,
		"die": die,
		
		
	}


func _change_state(state_name):
	if not _active:
		return
	
	
	if state_name in ["hurt", "attack", "chase"]:
		states_stack.push_front(states_map[state_name])

	._change_state(state_name)



