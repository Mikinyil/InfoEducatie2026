extends GridContainer

@onready var correct = ""
@onready var type1class = 1
@onready var questionnumber = 1

func level_enter(promp: int) -> void:
	questionnumber = promp
	Global.QuestionNumber = promp
	var q = get_question(0, questionnumber)
	correct = q["correct"]
	
	
func class_selector(a: int) -> void:
	type1class = a

func GiveAnswer(new_text: String) -> void:
	if(new_text.strip_edges() == str(correct).strip_edges()):
		print("yesss")
	else:
		print("noooo")
		print(new_text)
		print(correct)
	
	
var data1 = {}
func _ready() -> void:
	var file = FileAccess.open("res://Assets/Data/question_data.json", FileAccess.READ)
	if file == null:
		push_error("Could not open questions.json")
		return
	data1 = JSON.parse_string(file.get_as_text())
	file.close()

func get_question(class_index: int, question_id: int) -> Dictionary:
	var questions = data1["classes"][type1class]["questions"]
	for question in questions:
		if question["id"] == questionnumber:
			return question
	push_error("Question not found")
	return {}
