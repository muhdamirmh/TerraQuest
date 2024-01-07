extends Control


func _physics_process(delta):
	for n in 6:
		match Global.donelvl[n]:
			1:
				$MainPanel/ScrollContainer/VBoxContainer/Level/Level1/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			2:
				$MainPanel/ScrollContainer/VBoxContainer/Level/Level2/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			3:
				$MainPanel/ScrollContainer/VBoxContainer/Level2/Level3/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			4:
				$MainPanel/ScrollContainer/VBoxContainer/Level2/Level4/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			5:
				$MainPanel/ScrollContainer/VBoxContainer/Level3/Level5/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			6:
				$MainPanel/ScrollContainer/VBoxContainer/Level3/Level6/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
		match Global.donequiz[n]:
			1:
				$MainPanel/ScrollContainer/VBoxContainer/Quiz4/Quiz1/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			2:
				$MainPanel/ScrollContainer/VBoxContainer/Quiz4/Quiz2/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			3:
				$MainPanel/ScrollContainer/VBoxContainer/Quiz5/Quiz3/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			4:
				$MainPanel/ScrollContainer/VBoxContainer/Quiz5/Quiz4/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			5:
				$MainPanel/ScrollContainer/VBoxContainer/Quiz6/Quiz5/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			6:
				$MainPanel/ScrollContainer/VBoxContainer/Quiz6/Quiz6/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
		match Global.donecoin[n]:
			1:
				$MainPanel/ScrollContainer/VBoxContainer/Coin7/Coin1/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			2:
				$MainPanel/ScrollContainer/VBoxContainer/Coin7/Coin2/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			3:
				$MainPanel/ScrollContainer/VBoxContainer/Coin8/Coin3/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			4:
				$MainPanel/ScrollContainer/VBoxContainer/Coin8/Coin4/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			5:
				$MainPanel/ScrollContainer/VBoxContainer/Coin9/Coin5/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
			6:
				$MainPanel/ScrollContainer/VBoxContainer/Coin9/Coin6/TextureRect.set_texture(load("res://Assets/UI/yes.png"))
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	MusicController.playsfxbutton()
