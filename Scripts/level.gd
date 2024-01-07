extends Node2D

class_name Level

var num : int
var n : int
var dialogPath = ""
var keyword = "tail"
var paused = false
var maxcoins = [10, 17, 14, 15, 16, 17]

@onready var pause_menu = $CanvasLayer/PauseMenu


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _input(event):
#	if Input.is_action_just_pressed("Escape"):
#		pauseMenu()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.checklvl == num:
		endlvl(num)
	
func endlvl(num):
	
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	Global.itemget = false
	Global.isplaying[n] = false
	get_node("Player/Camera2D").set_zoom(Vector2(1,1))
	MusicController.stoplevel(num)
	Global.checklvl = 0
	GlobalParallaxBackground.show()
	
	
func ready2():
	DialogueManager.show_example_dialogue_balloon(load(dialogPath), keyword)
	MusicController.stopmainmenu()
	MusicController.playlevel(num)
	GlobalParallaxBackground.hide()
	Global.isplaying[n] = true
	print(n)
	
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
	

