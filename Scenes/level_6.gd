extends Level


# Called when the node enters the scene tree for the first time.
func _ready():
	num = 6
	n = num - 1
	dialogPath = "res://Dialog/Level6.dialogue"
	ready2()

func _on_pause_button_pressed():
	$CanvasLayer/PauseButton.hide()
	pauseMenu()
