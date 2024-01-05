extends Node

class_name Game

signal gamepaused(bool)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = not game_paused
		emit_signal("gamepaused", game_paused)
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("Escape")):
		game_paused = not game_paused
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
