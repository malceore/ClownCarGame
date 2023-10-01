extends Node2D

var mouseIsOver = false
var dragging = false

var cheated = false

var bootScene = preload("res://scenes/boot.tscn")
var clown = preload("res://scenes/clown_skeleton.tscn")
var currentClown
var boot

func _physics_process(delta):
	if(Input.is_action_pressed("Boot")):
		bootSlam()
	else:
		if(Input.is_action_pressed("LeftClick")):
			if(mouseIsOver):
				dragging = true
		else:
			dragging = false
	
		if(dragging):
			boot.apply_central_force(get_global_mouse_position() - boot.global_position)

func newClown():
	$GUILayer/AbortButton.show()
	
	currentClown = clown.instantiate()
	currentClown.global_position = $ClownSpawn.global_position
	add_child(currentClown)
	
	boot = bootScene.instantiate()
	boot.global_position = $BootSpawn.global_position
	add_child(boot)
	boot.mouse_entered.connect(_on_boot_mouse_entered)
	boot.mouse_exited.connect(_on_boot_mouse_exited)
	$Destination.set_monitoring(true)

func bootSlam():
	var slamVector = currentClown.get_node("physics_torso").global_position - boot.global_position
	boot.apply_impulse(slamVector.normalized() * 1000)

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

func _on_lock_button_pressed():
	$Destination.set_monitoring(false)
	$Destination/SuccessColor.set_color(Color.RED)
	$GUILayer/LockButton.hide()
	$GUILayer/AbortButton.hide()
	boot.queue_free()
	hide()

func _on_abort_button_pressed():
	$Destination.set_monitoring(false)
	cheated = true
	$Destination/SuccessColor.set_color(Color.RED)
	$GUILayer/LockButton.hide()
	$GUILayer/AbortButton.hide()
	boot.queue_free()
	currentClown.queue_free()
	hide()
