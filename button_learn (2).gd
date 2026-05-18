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
	get_tree().change_scene_to_file("res://lectii.tscn")
