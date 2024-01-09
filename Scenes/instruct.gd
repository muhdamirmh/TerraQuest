extends Control

func _input(event):
	pass


func _on_close_button_pressed():
	MusicController.playsfxbutton()
	hide()
