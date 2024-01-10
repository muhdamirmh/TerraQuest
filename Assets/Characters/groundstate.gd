extends State

class_name GroundState

@export var jump_velocity : float = -300.0
@export var air_state : State
@export var jump_animation : String = "jump"
@export var player : Player

@onready var buffer_timer : Timer = $Timer

func state_process(delta):
	player.max_jump = 1
	if(!character.is_on_floor()) && buffer_timer.is_stopped():
		next_state = air_state
	if character.is_on_floor() && Global.instructrange == true:
		can_move = false
	elif character.is_on_floor() && Global.instructrange == false:
		can_move = true
	player.connect("joystickjump", joystickjump)

func state_input(event : InputEvent):
	if event.is_action_pressed("Jump") and can_move == true:
		jump()
		
func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)
	player.sfxjump.play()
	
func joystickjump():
	if character.is_on_floor() and can_move == true:
		jump()


