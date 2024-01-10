extends CharacterBody2D

class_name Player

signal coinamount(int)
signal powerpos(pos)
signal joystickjump

@export var speed : float = 150.0
@export var DialogPath = ""
var max_jump = 1
var coins = 0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : PlayerStateMachine = $PlayerStateMachine
@onready var uimanager : UIManager = $UIManager
@onready var actionable_finder: Area2D = $ActionableFinder
@onready var sfxjump = $SFX/Jump
@onready var sfxdeath = $SFX/Death
@onready var sfxsteps = $SFX/Steps

var animalsrange = false
var playeratnpc = false
var quizrange = false
var instructrange = false
var wallrange = false
var powerWall = false
var trapshitcount = 0

var poscheckpoint : Vector2

var wallparent

var usersave = UserSave

@export var joystick_left : VirtualJoystick


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true
	usersave = UserSave.load_or_create()
	
func _input(event:InputEvent):
	
	if OS.get_name() == "Windows":
		if(event.is_action_pressed("Down") && is_on_floor()):
			position.y += 1
		if animalsrange == true || quizrange == true:
			if (event.is_action_pressed("Dialog") || event is InputEventMouseButton and event.double_click == true) && Global.playeratnpc == false:
				var actionables = actionable_finder.get_overlapping_areas()
				if actionables.size() > 0:
					actionables[0].action()
					
		if wallrange == true && powerWall == true:
			if event.is_action_pressed("E"):
				wallparent.queue_free()
				powerWall = false
				
	


func _physics_process(delta):
	
	Global.connect("addcoins", addcoins)
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if OS.get_name() == "Windows":
		$UIManager/Test/UI.visible = false
		$UIManager/Test/UI2.visible = false
		direction = Input.get_vector("Left", "Right", "up", "down")
		
		# Control whether to move or not to move
		
		if direction.x != 0 && state_machine.check_if_can_move():
			velocity.x = direction.x * speed
			if $Timer.time_left <= 0:
				sfxsteps.pitch_scale = randf_range(0.8, 1.2)
				sfxsteps.play()
				$Timer.start(0.4)
			
			
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

	if OS.get_name() == "Android":
		$UIManager/Test/UI.visible = true
		$UIManager/Test/UI2.visible = true
		direction = joystick_left.output
		if joystick_left and joystick_left.is_pressed and state_machine.check_if_can_move():
			velocity.x =  joystick_left.output.x * speed
			if direction.y >= 0.9:
				position.y += 1
			if $Timer.time_left <= 0:
				sfxsteps.pitch_scale = randf_range(0.8, 1.2)
				sfxsteps.play()
				$Timer.start(0.4)
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
	
	

	move_and_slide()
	update_animation_parameters()
	update_facing_direction()
	
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)


func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true



func _on_hitbox_area_entered(area):
	if area.is_in_group("Obstacles") :
		trapshitcount += 1
		sfxdeath.play()
		if trapshitcount >= 3:
			get_tree().reload_current_scene()
		else:
			uimanager.update_heart_display(trapshitcount)
			state_machine.current_state.can_move = false
			self.position = poscheckpoint

	elif area.is_in_group("powerJump"):
		if area.visible == true:
			max_jump = 2
			area.visible = false
		$Timer.start(1) 
		await $Timer.timeout
		area.visible = true
		
	elif area.is_in_group("powerTeleport"):
		if area.visible == true:
			speed = 0
			position = area.playerposition
			area.visible = false
			$Timer.start(0.5)
			await $Timer.timeout
			area.visible = true
			speed = 150

	elif area.is_in_group("powerWall"):
		powerWall = true

	elif area is Coins:
		addcoins(1)
		

	elif area.is_in_group("Animals"):
		animalsrange = true

	elif area.is_in_group("Items"):
		Global.itemget = true
		area.queue_free()
	
	elif area.is_in_group("Quiz"):
		quizrange = true

	elif area.is_in_group("Instructions"):
		instructrange = true

	elif area.is_in_group("Walls"):
		wallrange = true
		wallparent = area.get_parent()

	elif area.is_in_group("Checkpoints"):
		if area.get_parent().ischeck == false:
			poscheckpoint = area.get_parent().global_position
			area.get_parent().get_node("AnimatedSprite2D").play("green")
			area.get_parent().ischeck = true
		else:
			pass
		


func _on_hitbox_area_exited(area):
	if area.is_in_group("Animals"):
		animalsrange = false
		Global.playeratnpc = false
	elif area.is_in_group("Quiz"):
		quizrange = false
	elif area.is_in_group("Instructions"):
		instructrange = false
	elif area.is_in_group("Walls"):
		wallrange = false
		
func addcoins(coin):
	coins += coin
	uimanager.update_coins_display(coins)
	if coins == get_parent().maxcoins[get_parent().n]:
		Global.donecoin[get_parent().n] = get_parent().n + 1
		if usersave:
			usersave.donecoin = Global.donecoin
			usersave.save()


func _on_jump_pressed():
	emit_signal("joystickjump")


func _on_interact_pressed():
	if animalsrange == true || quizrange == true:
		if Global.playeratnpc == false:
			var actionables = actionable_finder.get_overlapping_areas()
			if actionables.size() > 0:
				actionables[0].action()
				
	if wallrange == true && powerWall == true:
		wallparent.queue_free()
		powerWall = false
