extends Node2D


@onready var big_circle = $Move/BigCircle
@onready var small_circle = $Move/BigCircle/SmallCircle
@onready var max_distance = $Move/CollisionShape2D.shape.radius
@onready var big_circle2 = $Jump/BigCircle
@export var player : Player


signal jump_now

var touched = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if Global.joystickenab == true:
		if event is InputEventScreenDrag:
			if event.position.distance_to(big_circle.global_position) != 0:
				var distance = event.position.distance_to(big_circle.global_position)
				var orimodulate = $Move.modulate
				if not touched:
					if distance < max_distance:
						touched = true
						$Move.modulate = Color(1, 1, 1)
				else:
					small_circle.position = Vector2(0,0)
					touched = false
					$Move.modulate = orimodulate
		elif event is InputEventScreenTouch:
			if player.animalsrange == true:
				pass
			else:
				var orimodulate = $Jump.modulate
				if event.is_pressed():
					if event.position.distance_to(big_circle2.global_position) <= 65:
						jump_now.emit()
						$Jump.modulate = Color(1, 1, 1)
				elif event.is_released():
					$Jump.modulate = orimodulate
	else:
		pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if touched:
		small_circle.global_position = get_global_mouse_position()
		small_circle.position = big_circle.position + (small_circle.position - big_circle.position).limit_length(max_distance)
func get_velo():
	var joy_velo = Vector2(0,0)
	joy_velo.x = small_circle.position.x / max_distance
	joy_velo.y = small_circle.position.y / max_distance
	return joy_velo
