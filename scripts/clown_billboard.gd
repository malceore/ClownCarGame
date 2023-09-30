extends Node3D

var enabled = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func disable():
	enabled = false
	position.y = position.y-1000
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
