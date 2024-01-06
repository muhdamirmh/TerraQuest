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
	print(example_dict[0][0])

	
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	MusicController.playsfxbutton()
	
func settext(value: String):
	$MainPanel/RichTextLabel.clear()
	for i in example_dict.size():
		if example_dict[i][0] == value:
			$MainPanel/RichTextLabel.append_text(example_dict[i][1])

func _on_lvl_1_1_pressed():
	MusicController.playsfxbutton()
	settext("1_1")

func _on_lvl_1_2_pressed():
	MusicController.playsfxbutton()
	settext("1_2")
	
func _on_lvl_1_3_pressed():
	MusicController.playsfxbutton()
	settext("1_3")

func _on_lvl_2_1_pressed():
	MusicController.playsfxbutton()
	settext("2_1")


func _on_lvl_2_2_pressed():
	MusicController.playsfxbutton()
	settext("2_2")


func _on_lvl_3_1_pressed():
	MusicController.playsfxbutton()
	settext("3_1")


func _on_lvl_4_1_pressed():
	MusicController.playsfxbutton()
	settext("4_1")


func _on_lvl_4_2_pressed():
	MusicController.playsfxbutton()
	settext("4_2")


func _on_lvl_4_3_pressed():
	MusicController.playsfxbutton()
	settext("4_3")


func _on_lvl_5_1_pressed():
	MusicController.playsfxbutton()
	settext("5_1")


func _on_lvl_5_2_pressed():
	MusicController.playsfxbutton()
	settext("5_2")


func _on_lvl_6_1_pressed():
	MusicController.playsfxbutton()
	settext("6_1")


func _on_lvl_6_2_pressed():
	MusicController.playsfxbutton()
	settext("6_2")


func _on_lvl_6_3_pressed():
	MusicController.playsfxbutton()
	settext("6_3")
