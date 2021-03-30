extends Node


#	Actual state machine
signal state_changed(current_state)

export(NodePath) var start_state

var states_map = {}
var states_stack = []
var current_state = null

var _active = false setget set_active

func _ready() -> void:
#	Connects all the states to the signal finished
	for child in get_children():
		child.connect("finished", self, "_change_state")

	initialize(start_state)


func initialize(initial_state):
#	Activates the state machine, pushes the initial state to the first place
#	in the stack and activates enter function inside the state 
	set_active(true)
	states_stack.push_front(get_node(initial_state))
	current_state = states_stack[0]
	current_state.enter()


func set_active(value):
	_active = value
	set_physics_process(value)
	set_process_input(value)
	
	if not _active:
		states_stack = []
		current_state = null

#	Makes sure that when the state machine is not active, nothing will work
func _unhandled_input(event: InputEvent) -> void:
	if not _active:
		return
	
	current_state.handle_input(event)


func _physics_process(delta):
	if not _active:
		return
	
	current_state.update(delta)



func _on_animation_finished(anim_name):
	if not _active:
		return
	
	current_state._on_animation_finished(anim_name)


func _change_state(state_name):
#	Controls the state transition
#	If the pushdown automaton is being used, the state machine will remove
# 	the first state in the stack and enter the previous one
#	If the basic state machine is being used, it will enter the state immediately 
	if not _active:
		return

	if state_name == "previous":
		states_stack.pop_front()
	
	else:
		states_stack[0] = states_map[state_name]

	current_state = states_stack[0]
	emit_signal("state_changed", current_state)
	
	current_state.enter()
