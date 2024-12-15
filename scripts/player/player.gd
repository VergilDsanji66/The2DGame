extends CharacterBody2D

signal health_depleted

@onready var mob_death_sfx: AudioStreamPlayer2D = $MobDeathSFX
@export var speed: float = 200
var health = 100.0

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
	
	#player damage
	const DAMAGE_RATE = 50.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health #use unquie name to call this bar, under insepection  hover the propaty to get the name
		if health <= 0.0:
			$AnimatedSprite2D.play("death")
			health_depleted.emit()#creates new signal in node signals
		else:
			$AnimatedSprite2D.play("hurt")
