extends Node2D

class_name Coins

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.is_in_group("Player"):
		$Timer.start(0.15)
		$SFX.play()
		await $Timer.timeout
		queue_free()
