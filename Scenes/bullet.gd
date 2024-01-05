extends Area2D

@export var speed : float = 4

func _physics_process(delta):
	position += speed * transform.x



func _on_body_entered(body):
	queue_free()
