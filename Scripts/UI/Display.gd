extends Node2D


onready var Health = $Health
onready var Message = $Message


func _process(_delta: float) -> void:
	Health.text = str(owner.lives)
	


func _on_StateMachine_state_changed(current_state) -> void:
	Message.text = current_state.get_name()
