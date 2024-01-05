extends Node2D


@onready var bulletPath = preload("res://Scenes/bullet.tscn")
@export_enum("Enabled", "Disabled") var fliph: String = "Disabled"
@export var speed : float = 1

var shootenable = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if fliph == "Enabled":
		$AnimatedSprite2D.flip_h = true
		$Marker2D.position.x = -$Marker2D.position.x
		$Marker2D.transform.x = -$Marker2D.transform.x
	GlobalParallaxBackground.hide()
	$AnimatedSprite2D.set_speed_scale(speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if $AnimatedSprite2D.get_frame() == 3 && shootenable == true:
		shoot()
		
		
		
		
func shoot():
	
	shootenable = false
	var bullet = bulletPath.instantiate()
	
	bullet.transform = $Marker2D.global_transform
	get_parent().add_child(bullet)
	$Timer.start(1)
	await $Timer.timeout
	shootenable = true
