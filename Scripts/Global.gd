extends Node


# Motion constants for player
# In 2D the negative numbers for y are up
const UP = Vector2(0, -1)
# Size of the tile_set
const UNIT_SIZE = 48
# Amount of gravitation force used both for player and enemies
var GRAVITY = .38 * UNIT_SIZE
# Variable used in other scripts as a condition for the behavior and power of enemies
# Defaults as Medium 
var difficulty := "Medium"
