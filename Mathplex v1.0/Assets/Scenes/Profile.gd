extends GridContainer

@onready var PPS = $Buttons/PP_Selector
@onready var Username = $Buttons2/PP_Selector

func LanguageUpdate(index: int) -> void:
	if(Global.Language == 1):
		PPS.text = "Poza de Profil"
		Username.text = "Nume de Utilizator:"
	if(Global.Language == 0):
		PPS.text = "Profile Picture:"
		Username.text = "Username:"

func _process(delta: float) -> void:
	LanguageUpdate(Global.Language)
