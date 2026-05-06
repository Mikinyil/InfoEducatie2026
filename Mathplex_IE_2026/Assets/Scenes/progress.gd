extends GridContainer

@onready var XP = 0
@onready var XPBar = $ProgressBar

var levels: int = 0

func _ready() -> void:
	load_data()
	XPBar.value = levels
	print(levels)

func _on_timer_timeout() -> void:
	XP = levels
	levels = levels + 1
	XPBar.value = XP
	prints(levels)
	
func _exit_tree() -> void:
	save_data()
	
func save_data():
	var data = {
		"levels": levels
	}

	var file = FileAccess.open("user://progress_data.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()
	
func load_data():
	if not FileAccess.file_exists("user://progress_data.json"):
		prints("nope")
		return

	var file = FileAccess.open("user://progress_data.json", FileAccess.READ)
	var content = file.get_as_text()
	file.close()

	var data = JSON.parse_string(content)
	
	if data:
		if data.has("levels"):
			levels = data["levels"]
	
