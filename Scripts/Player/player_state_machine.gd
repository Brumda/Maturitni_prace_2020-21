extends "res://Scripts/Statemachine/state_machine.gd"


onready var idle = $Idle
onready var move = $Move
onready var jump = $Jump
onready var attack = $Attack
onready var hurt = $Hurt
onready var die = $Die

func _ready():
	states_map = {
		"idle": idle,
		"move": move,
		"jump": jump,
		"attack": attack,
		"hurt": hurt,
		"die": die,
	}


func _change_state(state_name):
#	Defines which states use pushdown automaton instead of basic state machine
#	When player dies, the state machine shuts down
	if not _active:
		return
	
	if state_name in ["hurt", "jump", "attack"]:
		states_stack.push_front(states_map[state_name])
	
	if current_state.name == "Die":
		set_active(false)
	
	._change_state(state_name)


func _unhandled_input(event):
#	Additional conditions for attacking
	if not _active:
		return
	
	if event.is_action_pressed("attack"):
		if current_state.name in ["Attack", "Hurt", "Jump"
		 ] or floor(owner.velocity.y) != 18:
			return
		_change_state("attack")
