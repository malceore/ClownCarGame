extends Control

func timesUp():
	print("You lose")

func _process(delta):
	$TimeRemaining.text = "Time Remaining\n" + str($Timer.time_left)
