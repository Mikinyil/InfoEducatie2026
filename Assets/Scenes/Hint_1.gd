extends GridContainer

@onready var BackButton = $MenuButton


func Update() -> void:
	BackButton.tooltip_text = Global.Hint

func _process(delta: float) -> void:
	BackButton.tooltip_text = Global.Hint
	LanguageSelect(Global.Language)

func LanguageSelect(index: int) -> void:
	if(index == 0):
		BackButton.text = "Back to problem"
	elif(index == 1):
		BackButton.text = "Inapoi la problema"
