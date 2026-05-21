extends MarginContainer

@onready var start_screen = $Start
@onready var menu_screen = $Menu
@onready var options_screen = $Options
@onready var profile_screen = $Profile
@onready var levels_screen = $Levels
@onready var levelselector_screen = $LevelSelector
@onready var level_screen = $Level
@onready var Conclusion = $Level_Conclusion
@onready var Correct = $Level_Conclusion/Correct
@onready var Incorrect = $Level_Conclusion/Incorrect
@onready var PPS = $PP_Selector
@onready var SSS = $SelectScreen

@export var experience = 85

#============================================================================================

#============================================================================================


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
	Conclusion.visible = false
	PPS.visible = false
	SSS.visible = false

func back_button() -> void:
	start_screen.visible = false
	menu_screen.visible = true
	options_screen.visible = false
	profile_screen.visible = false
	levels_screen.visible = false
	levelselector_screen.visible = false
	level_screen.visible = false
	Conclusion.visible = false
	PPS.visible = false


func menu_profile() -> void:
	toggle_visibility(profile_screen)
	toggle_visibility(menu_screen)

func menu_SS() -> void:
	toggle_visibility(SSS)
	toggle_visibility(menu_screen)

func SS_levels() -> void:
	toggle_visibility(levels_screen)
	toggle_visibility(SSS)


func level_levelselector() -> void:
	toggle_visibility(levels_screen)
	toggle_visibility(levelselector_screen)
	
func enterlevel() -> void:
	toggle_visibility(levelselector_screen)
	toggle_visibility(level_screen)

func Answer_Correct() -> void:
	toggle_visibility(Conclusion)
	Correct.visible = true
	Incorrect.visible = false
	toggle_visibility(level_screen)
	
func Answer_Incorrect() -> void:
	toggle_visibility(Conclusion)
	Correct.visible = false
	Incorrect.visible = true
	toggle_visibility(level_screen)

func Answer_Levelselector() -> void:
	toggle_visibility(Conclusion)
	toggle_visibility(levelselector_screen)
	
func Profile_PP() -> void:
	toggle_visibility(profile_screen)
	toggle_visibility(PPS)
