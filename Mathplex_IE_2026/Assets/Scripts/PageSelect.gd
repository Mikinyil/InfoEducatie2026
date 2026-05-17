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
