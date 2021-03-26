extends Node2D


onready var Health = $Health

var is_dead := false

func _process(_delta: float) -> void:
	if !is_dead:
		Health.text = str(owner.lives)
	else:
		Health.text = ""

func _on_StateMachine_state_changed(current_state) -> void:
	if current_state.name == "Die":
		is_dead = true
