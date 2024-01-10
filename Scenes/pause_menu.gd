extends Control

@onready var level = $"../../"

var music = AudioServer.get_bus_index("Music")
var sfx = AudioServer.get_bus_index("SFX")

var usersave: UserSave

func _ready():
	hide()
	usersave = UserSave.load_or_create()
	if usersave.musicbutton:
		$Panel/Music/MusicButton.button_pressed = usersave.musicbutton
	if usersave.sfxbutton:
		$Panel/SFX/SFXButton.button_pressed = usersave.sfxbutton
	

func _on_resume_pressed():
	level.pauseMenu()
	get_parent().get_node("PauseButton").show()
	MusicController.playsfxbutton()


func _on_quit_pressed():
	level.pauseMenu()
	level.endlvl(level.num)
	MusicController.playsfxbutton()


func _on_music_button_pressed():
	AudioServer.set_bus_mute(music, not AudioServer.is_bus_mute(music))
	if usersave:
		usersave.musicmute = AudioServer.is_bus_mute(music)
		if $Panel/Music/MusicButton.button_pressed:
			usersave.musicbutton = true
		elif !$Panel/Music/MusicButton.button_pressed:
			usersave.musicbutton = false
		usersave.save()
	MusicController.playsfxbutton()


func _on_sfx_button_pressed():
	AudioServer.set_bus_mute(sfx, not AudioServer.is_bus_mute(sfx))
	if usersave:
		usersave.sfxmute = AudioServer.is_bus_mute(sfx)
		if $Panel/SFX/SFXButton.button_pressed:
			usersave.sfxbutton = true
		elif !$Panel/SFX/SFXButton.button_pressed:
			usersave.sfxbutton = false
		usersave.save()
	MusicController.playsfxbutton()


func _on_controls_pressed():
	MusicController.playsfxbutton()
	$Panel/Instruct.show()



func _on_close_pressed():
	MusicController.playsfxbutton()
	$Panel/Instruct.hide()
