extends Node2D

func spawn_mob():
	var new_mob = preload("res://scripts/mobs/mobs.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()#generate random number function
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()
