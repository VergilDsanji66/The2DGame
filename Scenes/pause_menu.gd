extends Control


#@onready var game =$pause
#
#func _on_resume_pressed():
	#game.puseMenu()




func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
