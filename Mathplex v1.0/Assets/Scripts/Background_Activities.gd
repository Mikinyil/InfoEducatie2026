extends MarginContainer

@onready var Music_Player1 = $MyCastleTown
var MusicSetting = false


func music_update(toggled_on: bool) -> void:
	MusicSetting = toggled_on
	if toggled_on:
		if not Music_Player1.playing:
			Music_Player1.play()
	else:
		Music_Player1.stop()
	save_data()

func _ready() -> void:
	load_data()
	await get_tree().process_frame
	music_update(MusicSetting)
	create_save_file()
	
func save_data():
	var data = {}
	if FileAccess.file_exists("user://progress_data.json"):
		var file = FileAccess.open("user://progress_data.json", FileAccess.READ)
		var existing = JSON.parse_string(file.get_as_text())
		file.close()
		if existing is Dictionary:
			data = existing
	data["MusicSetting"] = MusicSetting
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
		if data.has("MusicSetting"):
			MusicSetting = bool(data["MusicSetting"])

func create_save_file():
	if FileAccess.file_exists("user://progress_data.json"):
		print("Save file already exists, skipping.")
		return
	
	var default_data = {
		"levels": 1,
		"MusicSetting": false
	}
	
	var file = FileAccess.open("user://progress_data.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(default_data))
	file.close()
	print("Save file created with defaults.")
