extends Control

func _ready() -> void:
	self.hide()  # Ensure the PauseMenu is hidden at the start
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	self.hide()  # Hide the PauseMenu

func pause():
	get_tree().paused = true
	self.show()  # Show the PauseMenu
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()

func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	resume()  # Ensure the game isn't paused when transitioning to the main menu
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _process(delta: float) -> void:
	testEsc()
