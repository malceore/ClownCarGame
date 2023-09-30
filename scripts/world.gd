extends Node3D

@onready var clowns = get_tree().get_nodes_in_group("clowns")  
@onready var clownCountText = $UI/ClownCount
var gameOver = false

func _ready():
	$UI/DriveTimer.start()

func _process(delta):
	var disabled_clown_count = 0
	for clown in clowns:
		if !clown.enabled:
			disabled_clown_count += 1
	clownCountText.text = "Clowns " + str(disabled_clown_count) + "/" + str(clowns.size())
	if !gameOver and isVictory():
		win()
		
func isVictory():
	for clown in clowns:
		if clown.enabled:
			return false
	return true
	
func win():
	gameOver = true
	$UI/Summary/Title.text = "All Clowns Crammed"
	postSummary()

func lose():
	gameOver = true
	$UI/Summary/Title.text = "Just Laugh it off.."
	postSummary()
	
func postSummary():
	var disabled_clown_count = 0
	for clown in clowns:
		if !clown.enabled:
			disabled_clown_count += 1
	$UI/Summary/Breakdown.text = "Level Breakdown"
	$UI/Summary/Breakdown.text += "\n    Clowns " + str(disabled_clown_count) + "/" + str(clowns.size())
	$UI/Summary/Breakdown.text += "\n    Time remaining " + str(floor($UI/DriveTimer/Timer.time_left))
	$UI/Summary.visible = true
	
func _on_replay_button_pressed():
	get_tree().reload_current_scene()
	
func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
