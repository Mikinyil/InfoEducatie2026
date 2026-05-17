extends GridContainer

@onready var Type1 = $Type1
@onready var Type2 = $Type2
var typeclass
var questionnumber

func class_selector(a: int) -> void:
	typeclass = a
	

func Load_Question(a: int) -> void:
	questionnumber = a
	var q = get_question(0, a)
	if(q["type"]== 2):
		Type1.visible = 0
		Type2.visible = 1
	else:
		Type1.visible = 1
		Type2.visible = 0


	
var data1 = {}
func _ready() -> void:
	var file = FileAccess.open("res://Assets/Data/question_data.json", FileAccess.READ)
	if file == null:
		push_error("Could not open questions.json")
		return
	data1 = JSON.parse_string(file.get_as_text())
	file.close()

func get_question(class_index: int, question_id: int) -> Dictionary:
	var questions = data1["classes"][typeclass]["questions"]
	for question in questions:
		if question["id"] == questionnumber:
			return question
	push_error("Question not found")
	return {}
