extends Level


# Called when the node enters the scene tree for the first time.
func _ready():
	num = 5
	dialogPath = "res://Dialog/Level5.dialogue"
	ready2()
	
func _on_pause_button_pressed():
	$CanvasLayer/PauseButton.hide()
	pauseMenu()