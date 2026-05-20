extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = Button.new()
	button.text = ""
	button.pressed.connect(_button_pressed)
	add_child(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _button_pressed():
	var File_path = ProjectSettings.globalize_path("res://Assets/Data/Cazuri de nedeterminare.docx")
	OS.shell_open(File_path)
