extends Node2D

@onready var level = [
	$Button/Panel2/PanelContainer/Level2,
	$Button/Panel3/PanelContainer/Level3,
	$Button/Panel4/PanelContainer/Level4,
	$Button/Panel5/PanelContainer/Level5,
	$Button/Panel6/PanelContainer/Level6
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _input(event):
	if(event.is_action_pressed("Escape")):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for n in 5:
		if Global.donelvl[n] == n + 1:
			level[n].disabled = false
		else:
			level[n].disabled = true
	
	


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
	MusicController.playsfxbutton()


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	MusicController.playsfxbutton()


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_3.tscn")
	MusicController.playsfxbutton()


func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_4.tscn")
	MusicController.playsfxbutton()


func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_5.tscn")
	MusicController.playsfxbutton()


func _on_level_6_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_6.tscn")
	MusicController.playsfxbutton()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	MusicController.playsfxbutton()
