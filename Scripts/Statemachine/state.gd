extends Node

#	Basic template for all the states
#	Forces state to have this signal and those functions 
# warning-ignore:unused_signal
signal finished(next_state_name)

func enter() -> void:
	pass


func handle_input(_event) -> void:
	pass


func update(_delta) -> void:
	pass
