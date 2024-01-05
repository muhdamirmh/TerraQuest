extends Node2D

var music = AudioServer.get_bus_index("Music")
var sfx = AudioServer.get_bus_index("SFX")
var usersave = UserSave

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.playmainmenu()
	GlobalParallaxBackground.show()
	usersave = UserSave.load_or_create()
	usersave.save()
	if usersave.musicmute:
		AudioServer.set_bus_mute(music, usersave.musicmute)
	if usersave.sfxmute:
		AudioServer.set_bus_mute(sfx, usersave.sfxmute)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	MusicController.playsfxbutton()
	get_tree().change_scene_to_file("res://Scenes/select_level_menu.tscn")

func _on_quit_button_pressed():
	MusicController.playsfxbutton()
	get_tree().quit()


func _on_settings_button_pressed():
	MusicController.playsfxbutton()
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")

func _on_encyclopedia_button_pressed():
	MusicController.playsfxbutton()
	get_tree().change_scene_to_file("res://Scenes/encyclopedia.tscn")

func _on_achievement_button_pressed():
	MusicController.playsfxbutton()
	get_tree().change_scene_to_file("res://Scenes/achievement.tscn")


func _on_about_button_pressed():
	MusicController.playsfxbutton()
	get_tree().change_scene_to_file("res://Scenes/about.tscn")
