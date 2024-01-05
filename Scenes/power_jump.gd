extends Area2D

class_name powerJump

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
  
func _ready():
	animation.play()

func _process(delta):
	pass

