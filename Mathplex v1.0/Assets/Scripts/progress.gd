extends GridContainer

@onready var XP = 0
@onready var XPBar = $ProgressBar
# ──────────────────────────────────────────────────
const PROGRESS_PATH = "user://progress_data.json"
const SAVE_PATH     = "user://Problem_progress.json"

# ──────────────────────────────────────────────────
const DEFAULT_DATA = {
  "classes": [
	{
	  "name": "Cazuri de nedeterminare",
	  "questions": [
		{
		  "id": 1,
		  "answered_correctly": false
		},
		{
		  "id": 2,
		  "answered_correctly": false
		},
		{
		  "id": 3,
		  "answered_correctly": false
		},
		{
		  "id": 4,
		  "answered_correctly": false
		},
		{
		  "id": 5,
		  "answered_correctly": false
		},
		{
		  "id": 6,
		  "answered_correctly": false
		},
		{
		  "id": 7,
		  "answered_correctly": false
		},
		{
		  "id": 8,
		  "answered_correctly": false
		}
	  ]
	},
	{
	  "name": "Limite remarcabile",
	  "questions": [
		{
		  "id": 1,
		  "answered_correctly": false
		},
		{
		  "id": 2,
		  "answered_correctly": false
		},
		{
		  "id": 3,
		  "answered_correctly": false
		},
		{
		  "id": 4,
		  "answered_correctly": false
		},
		{
		  "id": 5,
		  "answered_correctly": false
		},
		{
		  "id": 6,
		  "answered_correctly": false
		},
		{
		  "id": 7,
		  "answered_correctly": false
		},
		{
		  "id": 8,
		  "answered_correctly": false
		}
	  ]
	},
	{
	  "name": "Calculul nedeterminantilor",
	  "questions": [
		{
		  "id": 1,
		  "answered_correctly": false
		},
		{
		  "id": 2,
		  "answered_correctly": false
		},
		{
		  "id": 3,
		  "answered_correctly": false
		},
		{
		  "id": 4,
		  "answered_correctly": false
		},
		{
		  "id": 5,
		  "answered_correctly": false
		},
		{
		  "id": 6,
		  "answered_correctly": false
		},
		{
		  "id": 7,
		  "answered_correctly": false
		},
		{
		  "id": 8,
		  "answered_correctly": false
		}
	  ]
	},
	{
	  "name": "Sisteme de ecuatii liniare",
	  "questions": [
		{
		  "id": 1,
		  "answered_correctly": false
		},
		{
		  "id": 2,
		  "answered_correctly": false
		},
		{
		  "id": 3,
		  "answered_correctly": false
		},
		{
		  "id": 4,
		  "answered_correctly": false
		},
		{
		  "id": 5,
		  "answered_correctly": false
		},
		{
		  "id": 6,
		  "answered_correctly": false
		},
		{
		  "id": 7,
		  "answered_correctly": false
		},
		{
		  "id": 8,
		  "answered_correctly": false
		}
	  ]
	},
	{
	  "name": "Determinanti",
	  "questions": [
		{
		  "id": 1,
		  "answered_correctly": false
		},
		{
		  "id": 2,
		  "answered_correctly": false
		},
		{
		  "id": 3,
		  "answered_correctly": false
		},
		{
		  "id": 4,
		  "answered_correctly": false
		},
		{
		  "id": 5,
		  "answered_correctly": false
		},
		{
		  "id": 6,
		  "answered_correctly": false
		},
		{
		  "id": 7,
		  "answered_correctly": false
		},
		{
		  "id": 8,
		  "answered_correctly": false
		}
	  ]
	}
  ]
}
# ──────────────────────────────────────────────────
var levels: int = 0
var progress_data : Dictionary = {}
# ──────────────────────────────────────────────────
func _ready() -> void:
	load_data()
	XPBar.value = levels
	print(levels)
	
func _save_problems() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(progress_data, "\t"))
		file.close()
	else:
		push_error("Could not save problem progress file.")
	
func load_data():
	if not FileAccess.file_exists(SAVE_PATH):
		print("Problem progress file not found. Creating new one at: ", SAVE_PATH)
		progress_data = DEFAULT_DATA.duplicate(true)
		_save_problems()
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var parsed = JSON.parse_string(file.get_as_text())
		file.close()
		if parsed != null:
			progress_data = parsed
		else:
			push_error("Problem progress file is corrupted. Resetting...")
			progress_data = DEFAULT_DATA.duplicate(true)
			_save_problems()
	else:
		push_error("Could not open problem progress file.")
# ───────────────────────────────────────────────────────
func get_total_questions() -> int:
	var total : int = 0
	for c in progress_data["classes"]:
		total += c["questions"].size()
	return total

func get_correct_answers() -> int:
	var correct : int = 0
	for c in progress_data["classes"]:
		for q in c["questions"]:
			if q["answered_correctly"]:
				correct += 1
	return correct

func print_stats() -> void:
	load_data()
	var correct = get_correct_answers()
	var total   = get_total_questions()
	XPBar.value = float(correct) / float(total) * 100

func answer_question() -> void:
	for c in progress_data["classes"][Global.classtype]["questions"]:
		if c["id"] == Global.QuestionNumber:
			c["answered_correctly"] = true
			_save_problems()
			print_stats()
			return
	
