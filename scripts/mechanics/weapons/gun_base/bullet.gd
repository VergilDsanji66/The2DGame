extends Area2D

var travell_distance = 0

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const  RANGE = 1500
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position -= direction * SPEED * delta
	
	travell_distance += SPEED * delta
	if travell_distance > RANGE:
		queue_free() #destroyes the bullet


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
