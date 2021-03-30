extends "res://Scripts/Statemachine/state_machine.gd"


onready var patrol = $Patrol
onready var idle = $Idle
onready var chase = $Chase
onready var attack = $Attack
onready var hurt = $Hurt
onready var die = $Die
onready var celebrating = $Celebrating

func _ready():
	states_map = {
		"patrol": patrol,
		"idle": idle,
		"chase": chase,
		"attack": attack,
		"hurt": hurt,
		"die": die,
		"celebrating": celebrating,
	}


func _change_state(state_name):
#	States which use pushdown automaton instead of the basic state machine
#	are listed here 
	if not _active:
		return
	
	if state_name in ["hurt", "attack", "chase", "die"]:
		states_stack.push_front(states_map[state_name])

	._change_state(state_name)
