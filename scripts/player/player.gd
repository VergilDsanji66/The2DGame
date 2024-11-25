extends CharacterBody2D

@export var speed: float = 200

func _physics_process(delta: float) -> void:
	# Get input direction
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Set velocity
	velocity = direction * speed
	
	# Move the character
	move_and_slide()
	
	# Determine and play animations based on movement
	if velocity.length() > 0:
		# Character is moving
		$AnimatedSprite2D.play("walking")
	else:
		# Character is idle
		$AnimatedSprite2D.play("idle")
	
	# Rotate (flip) based on horizontal movement
	if direction.x > 0:  # Moving right
		$AnimatedSprite2D.flip_h = false
	elif direction.x < 0:  # Moving left
		$AnimatedSprite2D.flip_h = true
func on_rolling():
	# Play rolling animation
	$AnimatedSprite2D.play("rolling")

func on_hurt():
	# Call this when the character gets hurt
	$AnimatedSprite2D.play("hurt")

func on_death():
	# Call this when the character dies
	$AnimatedSprite2D.play("death")

