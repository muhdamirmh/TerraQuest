extends Node

var playeratnpc = false
var dialogue = 0
var itemget = false

var instructrange = false
var joystickenab = false
var buffer = false

var checklvl = 0

var donelvl = [0,0,0,0,0,0]
var donequiz = [0,0,0,0,0,0]
var donecoin = [0,0,0,0,0,0]
var isplaying = [false,false,false,false,false,false]
var lvlpoints = 0

signal globalEnd
signal addcoins(value : int)

var usersave = UserSave

# Called when the node enters the scene tree for the first time.
func _ready():
	usersave = UserSave.load_or_create()
	if usersave.donelvl:
		donelvl = usersave.donelvl
	if usersave.donequiz:
		donequiz = usersave.donequiz
	if usersave.donecoin:
		donecoin = usersave.donecoin


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for n in 6:
		if checklvl == n + 1:
			donelvl[n] = n + 1
			if usersave:
				usersave.donelvl = donelvl
				usersave.save()
		if lvlpoints == 10 and isplaying[n] == true:
			donequiz[n] = n + 1
			if usersave:
				usersave.donequiz = donequiz
				usersave.save()
			
		
