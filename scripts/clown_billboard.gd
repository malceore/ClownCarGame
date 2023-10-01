extends Node3D

var enabled = true
var rng = RandomNumberGenerator.new()
func _ready():
	$Sprite3D.frame = rng.randf_range(0.0, 3.0)

func disable():
	enabled = false
	position.y = position.y-1000
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
