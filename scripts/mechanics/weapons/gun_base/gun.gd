extends Area2D

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies() # works with collision area
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front() # gets the first enemy in range
		var direction = (target_enemy.global_position - global_position).normalized()
		rotation = direction.angle() + PI # Rotate by 180 degrees use if guns are inverted


func shoot():
	const BULLET = preload("res://scripts/mechanics/weapons/gun_base/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %shootingpoint.global_position
	new_bullet.global_rotation = %shootingpoint.global_rotation
	%shootingpoint.add_child(new_bullet)


func _on_timer_timeout() -> void:
	shoot()
