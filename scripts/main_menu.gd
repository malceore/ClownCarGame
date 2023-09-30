extends Node2D

var currentDifficulty = "easy"
var diffCount = 0
var DIFFICULTIES = ["Easy", "Medium", "Hard"]

func _ready():
	pass # Replace with function body.

func _on_difficulty_pressed():
	if diffCount == DIFFICULTIES.size()-1:
		diffCount = 0
	else:
		diffCount += 1
	currentDifficulty = DIFFICULTIES[diffCount]
	$Menu/Difficulty.set_text(DIFFICULTIES[diffCount])
	
