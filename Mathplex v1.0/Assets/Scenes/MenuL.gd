extends GridContainer

@onready var Play = $MenuButton2
@onready var Options = $MenuButton
@onready var Profile = $MenuButton4
@onready var Exit = $MenuButton3

func LanguageUpdate(index: int) -> void:
	if(Global.Language == 1):
		Play.text = "Incepe"
		Options.text = "Optiuni"
		Profile.text = "Profil"
		Exit.text = "Iesire"
	if(Global.Language == 0):
		Play.text = "Play"
		Options.text = "Options"
		Profile.text = "Profile"
		Exit.text = "Exit"

func _process(delta: float) -> void:
	LanguageUpdate(Global.Language)
