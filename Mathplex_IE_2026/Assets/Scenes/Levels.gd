extends GridContainer

@onready var button1 = $Button
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var button4 = $Button4
@onready var button5 = $Button5
@onready var button6 = $Button6
@onready var button7 = $Button7
@onready var button8 = $Button8



func _on_button_pressed(a: int) -> void:
	print(a)


func level_enter(extra_arg_0: int) -> void:
	button1.text = "Level 1"
	button2.text = "Level 2"
	button3.text = "Level 3"
	button4.text = "Level 4"
	button5.text = "Level 5"
	button6.text = "Level 6"
	button7.text = "Level 7"
	button8.text = "Level 8"
