extends GridContainer
@onready var BackButton = $MenuButton



func LanguageSelect(index: int) -> void:
	if(index == 0):
		BackButton.text = "Back to Profile Editor"
	elif(index == 1):
		BackButton.text = "Inapoi la Editarea Profilului"

func _process(delta: float) -> void:
	LanguageSelect(Global.Language)
