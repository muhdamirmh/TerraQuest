extends State

@export var landing_animation_name : String = "land"
@export var ground_state : State

@onready var buffer_timer : Timer = $Timer

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == landing_animation_name) && buffer_timer.is_stopped() && character.is_on_floor():
		next_state = ground_state
