extends Node3D

@onready var clowns = get_tree().get_nodes_in_group("clowns")  
@onready var clownCountText = $UI/ClownCount

func _ready():
	$UI/DriveTimer.start()

func _process(delta):
	var disabled_clown_count = 0
	for clown in clowns:
		if !clown.enabled:
			disabled_clown_count += 1
	clownCountText.text = "Clowns " + str(disabled_clown_count) + "/" + str(clowns.size())
	if victory():
		print("You win!")

func victory():
	for clown in clowns:
		if clown.enabled:
			return false
	return true

