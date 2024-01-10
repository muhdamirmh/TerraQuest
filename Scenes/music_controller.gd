extends Node2D

var musiclevel : = [
	load("res://Assets/Audio/Music/biome songs/Biomes/Biomes/Jungle Music/WAV/jungle_loop.wav"),
	load("res://Assets/Audio/Music/biome songs/Biomes/Biomes/Savanna/Loop/savanna_loop.wav"),
	load("res://Assets/Audio/Music/biome songs/biome2/biome/wav/JDSherbert - Ambiences Music Pack - Desert Sirocco.wav"),
	load("res://Assets/Audio/Music/biome songs/biome2/biome/wav/JDSherbert - Ambiences Music Pack - Swamp of Digeridoos.wav"),
	load("res://Assets/Audio/Music/biome songs/Biomes/Biomes/Ocean Music/ocean.wav"),
	load("res://Assets/Audio/Music/biome songs/biome2/biome/wav/JDSherbert - Ambiences Music Pack - Frost Mountain Aura.wav")
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func playmainmenu():
	if $MainMenu.is_playing() == true:
		pass
	else:
		$MainMenu.play()
		

func stopmainmenu():
	$MainMenu.stop()
	
func playsfxbutton():
	$SFXButton.play()
	
func playlevel(num):
	$Level.set_stream(musiclevel[num - 1])
	$Level.play()
	
func stoplevel(num):
	$Level.stop()
