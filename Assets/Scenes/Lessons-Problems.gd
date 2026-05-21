extends GridContainer

@onready var Lessons = $MenuButton2
@onready var Problems = $MenuButton

func LanguageUpdate(index: int) -> void:
	if(Global.Language == 1):
		Lessons.text = "Lectii"
		Problems.text = "Probleme"
	if(Global.Language == 0):
		Lessons.text = "Lessons"
		Problems.text = "Problems"

func _process(delta: float) -> void:
	LanguageUpdate(Global.Language)
