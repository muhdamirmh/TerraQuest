extends Control


func _physics_process(delta):
	for n in 5:
		match Global.donelvl[n]:
			1:
				$MainPanel/ScrollContainer/VBoxContainer/HBoxContainer/Level1/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			2:
				$MainPanel/ScrollContainer/VBoxContainer/HBoxContainer/Level2/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			3:
				$MainPanel/ScrollContainer/VBoxContainer/HBoxContainer2/Level3/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			4:
				$MainPanel/ScrollContainer/VBoxContainer/HBoxContainer2/Level4/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			5:
				$MainPanel/ScrollContainer/VBoxContainer/HBoxContainer3/Level5/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			6:
				$MainPanel/ScrollContainer/VBoxContainer/HBoxContainer3/Level6/TextureRect.set_texture(load("res://Assets/UI/yes.png"))

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	MusicController.playsfxbutton()
