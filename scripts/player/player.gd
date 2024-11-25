extends CharacterBody2D

@export var speed: float = 600

func _physics_process(delta: float) -> void:
	# Get input direction
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Calculate velocity
	velocity = direction * speed
	
	# Move the character
	move_and_slide()

	# Rotate (flip) based on horizontal movement
	if direction.x > 0:  # Moving right
		$AnimatedSprite2D.flip_h = false
	elif direction.x < 0:  # Moving left
		$AnimatedSprite2D.flip_h = true
		
