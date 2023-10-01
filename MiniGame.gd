extends Node2D

var mouseIsOver = false
var dragging = false

var clown = preload("res://scenes/clown_skeleton.tscn")
var currentClown

func _physics_process(delta):
	if(Input.is_action_pressed("LeftClick")):
		if(mouseIsOver):
			dragging = true
	else:
		dragging = false
	
	if(dragging):
		$Boot.apply_central_force(get_global_mouse_position() - $Boot.global_position)

func newClown():
	currentClown = clown.instantiate()
	currentClown.global_position = $ClownSpawn.global_position
	add_child(currentClown)

func _on_boot_mouse_entered():
	mouseIsOver = true

func _on_boot_mouse_exited():
	mouseIsOver = false


func _on_destination_body_entered(body):
	if(body.owner == currentClown):
		$Destination/SuccessColor.set_color(Color.GREEN)
		$GUILayer/LockButton.show()
		
		body.constant_force = Vector2(-20,0)

func _on_destination_body_exited(body):
	if(body.owner == currentClown):
		$Destination/SuccessColor.set_color(Color.RED)
		$GUILayer/LockButton.hide()
		
		body.constant_force = Vector2(0,0)


func _on_button_pressed():
	$Destination/SuccessColor.set_color(Color.RED)
	$GUILayer/LockButton.hide()
	hide()
