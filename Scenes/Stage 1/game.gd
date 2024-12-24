extends Node2D

func spawn_mob():
	var new_mob = preload("res://scripts/mobs/mobs.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()#generate random number function
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true


func _on_restart_pressed() -> void:
	$GameOver.visible = false
	get_tree().paused = false  # Unpause the game
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	$GameOver.visible = false
	get_tree().paused = false  # Unpause the game
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
