extends TextureRect
@onready var PP = 1
@onready var Username = ""
@onready var Username_Node = $"../../Buttons2/LineEdit"

func save_data():
	var data = {}
	if FileAccess.file_exists("user://progress_data.json"):
		var file = FileAccess.open("user://progress_data.json", FileAccess.READ)
		var existing = JSON.parse_string(file.get_as_text())
		file.close()
		if existing is Dictionary:
			data = existing
	data["PP"] = PP
	data["Username"] = Username
	var file = FileAccess.open("user://progress_data.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func load_data():
	if not FileAccess.file_exists("user://progress_data.json"):
		print("No save file found.")
		return
	var file = FileAccess.open("user://progress_data.json", FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var data = JSON.parse_string(content)

	if data is Dictionary:
		if data.has("PP"):
			PP = data["PP"]
		if data.has("Username"):
			Username = data["Username"]
			
func _ready() -> void:
	load_data()
	PP_Update(PP)
	Username_Update(Username)

func PP_Update(a: int) -> void:
	if(a==1):
		texture = load("res://Assets/Images/ProfilePictures/PP1.png")
	if(a==2):
		texture = load("res://Assets/Images/ProfilePictures/PP2.png")
	if(a==3):
		texture = load("res://Assets/Images/ProfilePictures/PP3.png")
	if(a==4):
		texture = load("res://Assets/Images/ProfilePictures/PP4.png")
	save_data()
	
func Username_Update(a: String) -> void:
	Username = a
	if(Username == ""):
		Username_Node.placeholder_text = "[                         ]"
	else:
		Username_Node.text = ""
		Username_Node.placeholder_text = a
		save_data()
