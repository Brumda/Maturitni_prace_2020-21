extends Label


func _process(_delta: float) -> void:
	text = str(owner.lives)
