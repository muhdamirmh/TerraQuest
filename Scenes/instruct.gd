extends Control

func _ready():
	if OS.get_name() == "Android":
		var txtfile = "res://Assets/UI/androidinstruct.txt"
		var file = FileAccess.open(txtfile, FileAccess.READ)
		var text = file.get_as_text()
		$Panel/RichTextLabel.set_text(text)
		

func _input(event):
	pass


func _on_close_button_pressed():
	MusicController.playsfxbutton()
	hide()
