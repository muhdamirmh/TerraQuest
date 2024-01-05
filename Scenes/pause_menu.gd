extends Control

@onready var level = $"../../"

var music = AudioServer.get_bus_index("Music")
var sfx = AudioServer.get_bus_index("SFX")

func _ready():
	hide()
	


func _on_resume_pressed():
	level.pauseMenu()
	get_parent().get_node("PauseButton").show()


func _on_quit_pressed():
	level.pauseMenu()
	level.endlvl(level.num)


func _on_music_button_pressed():
	AudioServer.set_bus_mute(music, not AudioServer.is_bus_mute(music))
	MusicController.playsfxbutton()


func _on_sfx_button_pressed():
	AudioServer.set_bus_mute(sfx, not AudioServer.is_bus_mute(sfx))
	MusicController.playsfxbutton()


func _on_controls_pressed():
	$Panel/Instruct.show()
