extends Node2D


onready var begining = $Begining
onready var fight = $Enemy
onready var lock = $Lock
onready var fall = $Fall
onready var portal = $Portal_label
onready var end = $Portal_label2

#	Changing the visibility of the hints based on the position 
#	of the player in the tutorial
func _on_Label_cleaner_body_entered(_body: Node) -> void:
	begining.visible  = false
	fight.visible  = true


func _on_Label_cleaner2_body_entered(_body: Node) -> void:
	fight.visible  = false
	lock.visible = true


func _on_Label_cleaner3_body_entered(_body: Node) -> void:
	lock.visible = false
	fall.visible  = true


func _on_Label_cleaner4_body_entered(_body: Node) -> void:
	fall.visible  = false
	portal.visible = true


func _on_Label_cleaner5_body_entered(_body: Node) -> void:
	portal.visible = false
	if Global.kills == Global.enemies_in_room:
		if  Global.gems_collected != Global.gems:
			end.text = """You did it! You've managed to kill all the enemies!
However, you left behind some gems. They are very helpful you should
consider take a look around and find the rest of them."""
			yield(get_tree().create_timer(10), "timeout")
		
		else:
			end.text = """You did it! You've managed to kill all the enemies and collect all the gems!
Now you are ready for the real game. That portal will take you back into the main menu. Good luck."""


func _on_Tutorial_tree_exited() -> void:
#	Restores default value of maximum lives when the player exits the tutorial
		Global.max_lives = 30
