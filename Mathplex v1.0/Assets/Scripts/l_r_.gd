extends Button




func _button_pressed():
	var File_path = ProjectSettings.globalize_path("res://Assets/Data/Limite remarcabile.docx")
	OS.shell_open(File_path)
