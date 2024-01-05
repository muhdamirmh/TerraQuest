extends Area2D

@export_enum("1", "2", "3", "4", "5", "6") var level: String
var dialogue : = [
	load("res://Dialog/Level1.dialogue"),
	load("res://Dialog/Level2.dialogue"),
	load("res://Dialog/Level3.dialogue"),
	load("res://Dialog/Level4.dialogue"),
	load("res://Dialog/Level5.dialogue"),
	load("res://Dialog/Level6.dialogue")
	
]
# Called when the node enters the scene tree for the first time.
func _ready():
	match level:
		"1":
			$Actionable.dialogue_resource = dialogue[0]
		"2":
			$Actionable.dialogue_resource = dialogue[1]
		"3":
			$Actionable.dialogue_resource = dialogue[2]
		"4":
			$Actionable.dialogue_resource = dialogue[3]
		"5":
			$Actionable.dialogue_resource = dialogue[4]
		"6":
			$Actionable.dialogue_resource = dialogue[5]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
