extends Position2D


onready var parent = get_parent()


func _ready() -> void:
	update_pivot_angle()


func _physics_process(_delta: float) -> void:
	update_pivot_angle()

func update_pivot_angle():
	rotation = Vector2(parent.look_direction, 0).angle()
