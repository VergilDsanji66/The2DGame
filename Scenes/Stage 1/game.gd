extends Node2D

@onready var PauseMenu = $pause

var paused = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		PauseMenu.hide()
		Engine.time_scale = 1
	else:
		PauseMenu.show()
		Engine.time_scale = 0
	
	paused = !paused
