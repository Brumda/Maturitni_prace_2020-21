extends KinematicBody2D


onready var gems_counter_UI = get_node("UI/Gems")
onready var heal_sound =  $SoundEffects/Heal
onready var soundtrack = get_node("SoundEffects/BasicSoundtrack")
onready var soundtrack_enemies = get_node("SoundEffects/Soundtrack_enemies")
onready var broke_leg = $SoundEffects/Breakingleg
onready var sound = $SoundEffects

var fell := false
var lives = Global.max_lives
var look_direction = 1 
var velocity = Vector2()

func _physics_process(_delta):
	if Global.change_soundtrack and !soundtrack.is_playing() and lives > 0:
		soundtrack_enemies.stop()
		soundtrack.play()
	
#	Basic movement definition of the player
	velocity.y = move_and_slide(velocity, Global.UP, 1).y
	velocity.y += Global.GRAVITY
	gem_counter_displayer()
#	If the player is falling for too long, he will either take damage or die
	if velocity.y > 900:
		fell = true
	
	if velocity.y > 1400:
		take_damage(lives)
	
	if fell and is_on_floor():
		broke_leg.play()
		fell = false
		take_damage(15)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("rotation_lock"):
		Global.lock = not Global.lock


func take_damage(amount):
	$StateMachine/Got_hit.take_damage(amount)


func _on_Player_ready():
# 	Everything that needs to get reset when the game starts, the player dies
#	or the level changes
	
	soundtrack_enemies.play()
	Global.gems_collected = 0
	Global.kills = 0
	Global.gems = 0
	Global.enemies_in_room = 0
	if Global.restart and Global.more_health:
		Global.max_lives -= 10
		lives = Global.max_lives
		
	Global.lock = false
	Global.restart = false
	Global.more_health = false
	Global.player_is_dead = false
	Global.change_soundtrack = false
#	You won't be able to see the mouse cursor in the game
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
#	Activates animations
	$Body/AnimationPlayer/AnimationTree.set_active(true)


func _on_gem_collected(area: Area2D) -> void:
#	Handles healing and gem counting
	if area.is_in_group("Gems"):
		heal_sound.play()
		yield(get_tree().create_timer(1), "timeout")
		if Global.player_is_dead:
			return
#	When teh player picks up all the gems, his maximum amount of lives grows
#	and all lives are replenished  
		if Global.gems == Global.gems_collected and !Global.more_health:
			Global.max_lives += 10
			lives = Global.max_lives
			Global.more_health = true
		
		if lives < Global.max_lives:
			if lives + 10 > Global.max_lives:
				lives = Global.max_lives
			else:
				lives += 10


func gem_counter_displayer():
	gems_counter_UI.text = ("You have collected " + str(Global.gems_collected) 
	+ "/" + str(Global.gems) + " gems")
