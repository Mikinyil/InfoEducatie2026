extends GridContainer

@onready var Left = $Back
@onready var Right = $Next
@onready var pathscript = "Menu/Level/LevelType1/GridContainer/Button"
var page

func pageselect(a: int) -> void:
	page = a;
	if(a==0):
		Left.disabled = true
		Right.disabled = false
	else:
		if(a==2):
			Left.disabled = false
			Right.disabled = true
		else:
			Left.disabled = false
			Right.disabled = false

func changepage(a: int) -> void:
	pageselect(page + a)
	pass

func LanguageUpdate(index: int) -> void:
	if(Global.Language == 1):
		Left.text = "Inapoi"
		Right.text = "Inainte"
	if(Global.Language == 0):
		Left.text = "Back"
		Right.text = "Next"

func _process(delta: float) -> void:
	LanguageUpdate(Global.Language)
