extends CanvasLayer

class_name UIManager


func _ready():
	$CoinIcon/AnimatedSprite2D.play("coin")
	
	
func update_coins_display(coins):
	$CoinDisplay.text = str(coins)
	
func update_heart_display(heart):
	if heart == 1:
		$TextureRect/Heart1.play("empty")
	elif heart == 2:
		$TextureRect/Heart2.play("empty")
