extends GridContainer

@onready var Music = $MusicSettings
var MusicSetting
func load_data():
	if not FileAccess.file_exists("user://progress_data.json"):
		print("No save file found.")
		return
	var file = FileAccess.open("user://progress_data.json", FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var data = JSON.parse_string(content)
	
	if data is Dictionary:
		if data.has("MusicSetting"):
			MusicSetting = bool(data["MusicSetting"])

func _ready() -> void:
	load_data()
	if MusicSetting == true:
		Music.button_pressed = true
