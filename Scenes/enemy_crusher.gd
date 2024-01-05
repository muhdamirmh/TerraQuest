extends Area2D

@export var speed : float = 2
@export var speedscale : float = 1
@export_enum("up", "down") var direction: String = "up"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.set_speed_scale(speedscale)
	$AnimatedSprite2D.play(direction)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AnimatedSprite2D.get_frame() == 5:
		$AnimatedSprite2D.pause()
		if $AnimatedSprite2D.get_animation() == "down":
			position += speed * transform.y
		elif $AnimatedSprite2D.get_animation() == "up":
			position -= speed * transform.y

func _on_body_entered(body):
	$AnimatedSprite2D.set_frame(6)
	$AnimatedSprite2D.play()
	animplaying()
	
func animplaying():
	if $AnimatedSprite2D.is_playing():
		if $AnimatedSprite2D.get_animation() == "down":
			await $AnimatedSprite2D.animation_finished
			$AnimatedSprite2D.play("up")
		elif $AnimatedSprite2D.get_animation() == "up":
			await $AnimatedSprite2D.animation_finished
			$AnimatedSprite2D.play("down")
	else:
		pass
