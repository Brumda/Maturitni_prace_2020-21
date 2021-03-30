extends Label

onready var lifebar = get_parent().get_node("Lifebar")

func _process(_delta: float) -> void:
#	Player lifebar
	text = str(owner.lives) + "/" + str(Global.max_lives)
	lifebar.max_value = int(Global.max_lives)
	lifebar.value = owner.lives
