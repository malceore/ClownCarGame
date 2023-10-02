extends Node2D

var diffCount = 0
var DIFFICULTIES = ["Easy", "Medium", "Hard"]
var optionsCount = 0
var OPTIONS = ["Off", "On"]

func _on_difficulty_pressed():
	if diffCount == DIFFICULTIES.size()-1:
		diffCount = 0
	else:
		diffCount += 1
	Global.currentDifficulty = DIFFICULTIES[diffCount]
	$Menu/Difficulty.set_text(DIFFICULTIES[diffCount])
	
func _on_toggle_mobile_controls_pressed():
	if optionsCount == OPTIONS.size()-1:
		optionsCount = 0
	else:
		optionsCount += 1
	Global.mobileControls = OPTIONS[optionsCount]
	$Menu/ToggleMobileControls.set_text(OPTIONS[optionsCount])
			
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/level_world_2.tscn")	

func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/level_world_3.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://scenes/level_world_3.tscn")


