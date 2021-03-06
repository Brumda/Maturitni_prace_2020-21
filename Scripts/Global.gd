extends Node


#Motion constants for player
#In 2D the negative numbers for y are up
const UP = Vector2(0, -1)
const UNIT_SIZE = 48
var GRAVITY = .38 * UNIT_SIZE
var snap = Vector2(0, UNIT_SIZE)
#Variable tracking your level progress
var key_parts = 0
var kills = 0
