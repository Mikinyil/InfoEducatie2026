extends GridContainer

@onready var Music = $MusicSettings
@onready var Hint = $HintsSettings
@onready var Language = $OptionButton
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
		if data.has("HintSetting"):
			Global.HintSetting = bool(data["HintSetting"])
		if data.has("Language"):
			Global.Language = int(data["Language"])


func _ready() -> void:
	load_data()
	if MusicSetting == true:
		Music.button_pressed = true
	if Global.HintSetting == true:
		Hint.button_pressed = true
	if Global.Language == 1:
		Language.selected = 1
	LanguageChange(Global.Language)

func HintUpdate(toggled_on: bool) -> void:
	Global.HintSetting = toggled_on
	save_data()

func save_data():
	var data = {}
	if FileAccess.file_exists("user://progress_data.json"):
		var file = FileAccess.open("user://progress_data.json", FileAccess.READ)
		var existing = JSON.parse_string(file.get_as_text())
		file.close()
		if existing is Dictionary:
			data = existing
	data["HintSetting"] = bool(Global.HintSetting)
	data["Language"] = Global.Language
	var file = FileAccess.open("user://progress_data.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()


func LanguageChange(index: int) -> void:
	Global.Language = index
	save_data()
	if(Global.Language == 1):
		Music.text = "Muzica"
		Hint.text = "Indicii"
		Language.selected = 1
	if(Global.Language == 0):
		Music.text = "Muzic"
		Hint.text = "Hints"
		Language.selected = 0
