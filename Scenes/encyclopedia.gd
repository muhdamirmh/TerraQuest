extends Control

var example_dict = {}

func _ready():

	import_resources_data()

func _physics_process(delta):
	for n in 5:
		if Global.donelvl[n] == n + 1:
			var button = get_tree().get_nodes_in_group("Level" + str(n+1))
			for buttons in button:
				buttons.disabled = false

func import_resources_data():

	var file = FileAccess.open("res://Assets/Data/encyclopedia.txt", FileAccess.READ)

	while !file.eof_reached():

		var data_set = Array(file.get_csv_line())

		example_dict[example_dict.size()] = data_set

	file.close()

	print(example_dict)

	
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	MusicController.playsfxbutton()
func settext(value: int):
	$MainPanel/RichTextLabel.clear()
	$MainPanel/RichTextLabel.append_text(example_dict[value][1])

func _on_lvl_1_1_pressed():
	settext(0)

func _on_lvl_1_2_pressed():
	settext(1)
	
func _on_lvl_1_3_pressed():
	settext(2)


func _on_lvl_1_4_pressed():
	settext(3)


func _on_lvl_2_1_pressed():
	pass # Replace with function body.


func _on_lvl_2_2_pressed():
	pass # Replace with function body.


func _on_lvl_2_3_pressed():
	pass # Replace with function body.


func _on_lvl_2_4_pressed():
	pass # Replace with function body.
