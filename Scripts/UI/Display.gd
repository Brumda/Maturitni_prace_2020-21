extends Node2D


onready var lifebar = $Lifebar

var is_dead := false

#	Controls enemy lifebars
func _ready() -> void:
	yield(get_tree().create_timer(3), "timeout")
	lifebar.max_value = owner.lives


func _process(_delta: float) -> void:
	if !is_dead:
		lifebar.value = owner.lives
	else:
		lifebar.visible = false

func _on_StateMachine_state_changed(current_state) -> void:
	if current_state.name == "Die":
		is_dead = true
