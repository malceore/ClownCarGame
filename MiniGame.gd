extends Node2D

var mouseIsOver = false
var dragging = false

func _physics_process(delta):
	if(Input.is_action_pressed("LeftClick")):
		if(mouseIsOver):
			dragging = true
	else:
		dragging = false
	
	if(dragging):
		$Boot.apply_central_force(get_global_mouse_position() - $Boot.global_position)

func _on_boot_mouse_entered():
	mouseIsOver = true

func _on_boot_mouse_exited():
	mouseIsOver = false


func _on_destination_body_entered(body):
	if(body.owner == $Clown):
		$Destination/SuccessColor.set_color(Color.GREEN)
		$LockButton.show()
		
		body.constant_force = Vector2(-20,0)

func _on_destination_body_exited(body):
	if(body.owner == $Clown):
		$Destination/SuccessColor.set_color(Color.RED)
		$LockButton.hide()
		
		body.constant_force = Vector2(0,0)


func _on_button_pressed():
	hide()
