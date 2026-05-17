extends GridContainer

@onready var button1 = $Button
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var button4 = $Button4
@onready var button5 = $Button5
@onready var button6 = $Button6
@onready var button7 = $Button7
@onready var button8 = $Button8

var page = 0;

func level_enter(a: int) -> void:
	button1.text = "Level " + str(a*8+1)
	button2.text = "Level " + str(a*8+2)
	button3.text = "Level " + str(a*8+3)
	button4.text = "Level " + str(a*8+4)
	button5.text = "Level " + str(a*8+5)
	button6.text = "Level " + str(a*8+6)
	button7.text = "Level " + str(a*8+7)
	button8.text = "Level " + str(a*8+8)
	page=a

func pagechange(a: int) -> void:
	level_enter(page + a)
	pass


func class_selected(a: int) -> void:
	page = a
