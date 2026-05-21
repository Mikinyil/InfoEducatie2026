extends GridContainer
@onready var Start = $MenuButton



func LanguageSelect(index: int) -> void:
	if(index == 0):
		Start.text = "Back to menu"
	elif(index == 1):
		Start.text = "Inapoi la meniu"

func _process(delta: float) -> void:
	LanguageSelect(Global.Language)
