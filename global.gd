extends Node

var playeratnpc = false
var dialogue = 0
var itemget = false
var lvlpoints = 0
var instructrange = false
var joystickenab = false
var buffer = false

var checklvl = 0

var donelvl = [0,0,0,0,0,0]

signal globalEnd
signal addcoins(value : int)

var usersave = UserSave

# Called when the node enters the scene tree for the first time.
func _ready():
	usersave = UserSave.load_or_create()
	if usersave.donelvl:
		donelvl = usersave.donelvl


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for n in 5:
		if checklvl == n + 1:
			donelvl[n] = n + 1
			if usersave:
				usersave.donelvl = donelvl
				usersave.save()
			
			
		
