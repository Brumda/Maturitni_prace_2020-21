extends Camera2D


func _on_Player_grounded_updated(is_grounded):
	yield(get_tree().create_timer(0.3), "timeout")
	drag_margin_v_enabled = !is_grounded
