extends Control

var music = AudioServer.get_bus_index("Music")
var sfx = AudioServer.get_bus_index("SFX")

var usersave: UserSave

# Called when the node enters the scene tree for the first time.
func _ready():
	usersave = UserSave.load_or_create()
	if usersave.musicbutton:
		$Panel/VBoxContainer/Music/MusicButton.button_pressed = usersave.musicbutton
	if usersave.sfxbutton:
		$Panel/VBoxContainer/SFX/SFXButton.button_pressed = usersave.sfxbutton
	
func _input(event):
	if(event.is_action_pressed("Escape")):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_music_button_pressed():
	AudioServer.set_bus_mute(music, not AudioServer.is_bus_mute(music))
	if usersave:
		usersave.musicmute = AudioServer.is_bus_mute(music)
		if $Panel/VBoxContainer/Music/MusicButton.button_pressed:
			usersave.musicbutton = true
		elif !$Panel/VBoxContainer/Music/MusicButton.button_pressed:
			usersave.musicbutton = false
		usersave.save()
	MusicController.playsfxbutton()


func _on_sfx_button_pressed():
	AudioServer.set_bus_mute(sfx, not AudioServer.is_bus_mute(sfx))
	if usersave:
		usersave.sfxmute = AudioServer.is_bus_mute(sfx)
		if $Panel/VBoxContainer/SFX/SFXButton.button_pressed:
			usersave.sfxbutton = true
		elif !$Panel/VBoxContainer/SFX/SFXButton.button_pressed:
			usersave.sfxbutton = false
		usersave.save()
	MusicController.playsfxbutton()
	


#func _on_joystick_button_toggled(button_pressed):
#	Global.joystickenab = not Global.joystickenab
#	MusicController.playsfxbutton()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	MusicController.playsfxbutton()


func _on_control_pressed():
	$Panel/Control/Instruct.show()
