extends Node2D


onready var begining = $Begining
onready var fight = $FallandEnemy

func _on_Label_cleaner_body_entered(_body: Node) -> void:
	begining.visible  = false
	fight.visible  = true


func _on_Label_cleaner2_body_entered(_body: Node) -> void:
	fight.visible  = false
