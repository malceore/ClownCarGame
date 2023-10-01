extends Control

@export var time = 60

func _ready():
	$Timer.wait_time = time

func _process(delta):
	$TimeRemaining.text = "Time Remaining\n" + str(floor($Timer.time_left)) + "s"
	
func start():
	$Timer.start()
	$audioTimer.play()
func stop():
	$Timer.stop()
	$audioTimer.stop()
func _on_timer_timeout():
	owner.lose()
	$audioLose.play()
	$audioTimer.stop()
