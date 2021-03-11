extends Node



# In 2D, the negative numbers for the y-axis are up
const UP = Vector2(0, -1)
# Size of the used tile set
const UNIT_SIZE = 48
# Amount of gravitational force used both for player and enemies
var GRAVITY = .38 * UNIT_SIZE
# Variable used in other scripts as a condition for the behavior and power of enemies
# Defaults as Medium 
var difficulty := "Medium"
# Variables used to track what is in the current room and the player's progress
var enemies_in_room := 0
var gems := 0

var gems_collected := 0
var kills := 0
