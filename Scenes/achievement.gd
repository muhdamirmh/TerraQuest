extends Control


func _physics_process(delta):
	if Global.donelvl[0] == 1:
		$MainPanel/ScrollContainer/VBoxContainer/HBoxContainer/Level1/TextureRect.set_texture(load("res://Assets/UI/yes.png"))

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	MusicController.playsfxbutton()
