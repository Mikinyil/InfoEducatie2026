extends GridContainer

@onready var button1 = $Button
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var button4 = $Button4
@onready var correct = 1

signal answercheck()

func level_enter(promp: int) -> void:
	button1.text = "Answer 1"
	button2.text = "Answer 2"
	button3.text = "Answer 3"
	button4.text = "Answer 4"
	
	if promp == 1:
		button1.text = "Answer 1"
		button2.text = "Answer 2"
		button3.text = "Answer 3"
		button4.text = "Answer 4"
		correct = 2

func answer_enter(answer: int) -> void:
	if answer == correct:
		answercheck.emit()
