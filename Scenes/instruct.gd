extends Control

func _input(event):
	if event.is_action_pressed("Dialog") || (event is InputEventMouseButton and event.double_click == true) :
		hide()
