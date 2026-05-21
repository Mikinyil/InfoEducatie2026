extends Button

func _button_pressed():
	var File_path = ProjectSettings.globalize_path("res://Assets/Data/Calculul nedeterminarilor.docx")
	OS.shell_open(File_path)


func Sistemecuatii() -> void:
	var File_path = ProjectSettings.globalize_path("res://Assets/Data/Sisteme de ecuatii liniare.docx")
	OS.shell_open(File_path)


func _on_pressedaa() -> void:
	var File_path = ProjectSettings.globalize_path("res://Assets/Data/Determinanti.docx")
	OS.shell_open(File_path)
