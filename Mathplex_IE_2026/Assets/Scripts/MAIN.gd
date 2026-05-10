extends MarginContainer

@onready var start_screen = $Start
@onready var menu_screen = $Menu
@onready var options_screen = $Options
@onready var profile_screen = $Profile
@onready var levels_screen = $Levels
@onready var levelselector_screen = $LevelSelector
@onready var level_screen = $Level

@export var experience = 85

signal answercheck()

func toggle_visibility(object):
	object.visible = !object.visible
	
func menu_options():
	toggle_visibility(options_screen)
	toggle_visibility(menu_screen)


func _on_menu_button_pressed() -> void:
	toggle_visibility(start_screen)
	toggle_visibility(menu_screen)


func escape() -> void:
	get_tree().quit()

func _ready() -> void:
	start_screen.visible = true
	menu_screen.visible = false
	options_screen.visible = false
	profile_screen.visible = false
	levels_screen.visible = false
	level_screen.visible = false
	levelselector_screen.visible = false


func back_button() -> void:
	start_screen.visible = false
	menu_screen.visible = true
	options_screen.visible = false
	profile_screen.visible = false
	levels_screen.visible = false
	levelselector_screen.visible = false
	level_screen.visible = false


func menu_profile() -> void:
	toggle_visibility(profile_screen)
	toggle_visibility(menu_screen)


func menu_levels() -> void:
	toggle_visibility(levels_screen)
	toggle_visibility(menu_screen)


func level_levelselector(extra_arg_0: int) -> void:
	toggle_visibility(levels_screen)
	toggle_visibility(levelselector_screen)
	
func enterlevel() -> void:
	toggle_visibility(levelselector_screen)
	toggle_visibility(level_screen)
