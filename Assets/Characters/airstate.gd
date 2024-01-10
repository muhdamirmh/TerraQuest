extends State

class_name AirState

@export var ground_state : State
@export var double_jump_velocity : float = -350
@export var double_jump_animation : String = "double_jump"
@export var landing_animation : String = "land"
@export var player : Player

func state_process(delta):
	if(character.is_on_floor()):
		next_state = ground_state
	player.connect("joystickjump", joystickdoublejump)
	
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("Jump") && player.max_jump == 2):
		double_jump()

func on_exit():
	if(next_state == ground_state):
		playback.travel("land")
		

func on_enter():
	can_move = true

func double_jump():
	character.velocity.y = double_jump_velocity
	playback.travel(double_jump_animation)
	player.max_jump = 1
	player.sfxjump.play()

func joystickdoublejump():
	if player.max_jump == 2:
		double_jump()


