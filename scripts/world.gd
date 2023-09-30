extends Node3D

@onready var clowns = get_tree().get_nodes_in_group("clowns")  


func _ready():
	pass
	#parentCamera()

func _process(delta):
	if victory():
		print("You win!")

func victory():
	for clown in clowns:
		if clown.enabled:
			return false
	return true

