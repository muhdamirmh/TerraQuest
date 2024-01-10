extends Level

# Called when the node enters the scene tree for the first time.
func _ready():
	num = 2
	n = num - 1
	dialogPath = "res://Dialog/Level2.dialogue"
	
	if OS.get_name() == "Windows":
		var txtfile = "res://Assets/UI/androidlevel2.txt"
		var file = FileAccess.open(txtfile, FileAccess.READ)
		var text = file.get_as_text()
		$CanvasLayer/Instruct/Panel/RichTextLabel.set_text(text)
		
	ready2()
	
func _on_pause_button_pressed():
	$CanvasLayer/PauseButton.hide()
	pauseMenu()
	MusicController.playsfxbutton()
	
func _on_restart_button_pressed():
	MusicController.playsfxbutton()
	get_tree().reload_current_scene()
