class_name UserSave extends Resource

@export var donelvl: Array = []
@export var donequiz: Array = []
@export var donecoin: Array = []

@export var musicmute: bool
@export var sfxmute: bool
@export var musicbutton: bool
@export var sfxbutton: bool

func save() -> void:
	ResourceSaver.save(self, "user://usersave.tres")
	
static func load_or_create() -> UserSave:
	var res: UserSave = load("user://usersave.tres") as UserSave
	if !res:
		res = UserSave.new()
	return res
