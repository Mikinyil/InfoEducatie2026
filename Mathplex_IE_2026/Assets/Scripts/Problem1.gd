extends GridContainer

@onready var button1 = $Button
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var button4 = $Button4
@onready var ScriptPath = $"../../.."

@onready var Type1Correct = 1
@onready var Type2Correct = ""
@onready var typeclass = 1
@onready var questionnumber = 1



func level_enter(promp: int) -> void:
	questionnumber = promp
	button1.text = "Answer 1"
	button2.text = "Answer 2"
	button3.text = "Answer 3"
	button4.text = "Answer 4"
	var q = get_question(0, promp)
	if(q["type"] == 1):
		Type1Correct = int(q["correct"])
	if(q["type"] == 2):
		Type2Correct = q["correct"]
	if q["answers"] != []:
		button1.text = q["answers"][0]
		button2.text = q["answers"][1]
		button3.text = q["answers"][2]
		button4.text = q["answers"][3]


func Type1Answer(answer: int) -> void:
	if(answer == Type1Correct):
		ScriptPath.Answer_Correct()
	else:
		ScriptPath.Answer_Incorrect()
	pass

func Type2Answer(new_text: String) -> void:
	if(new_text.strip_edges() == Type2Correct.strip_edges()):
		ScriptPath.Answer_Correct()
	else:
		ScriptPath.Answer_Incorrect()
		print(new_text)
		print(Type2Correct)


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

func class_selector(a: int) -> void:
	typeclass = a
