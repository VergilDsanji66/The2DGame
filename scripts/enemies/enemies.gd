extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D  # Adjust path if necessary
var player  # Reference to the player or target node
var min_distance = 50.0  # Minimum distance before stopping
var move_speed = 300.0  # Movement speed of the enemy

func _ready():
	# Set the initial animation
	sprite.play("walk")
	player = get_parent().get_node("Player")  # Adjust the path to your player node

func switch_to_hurt():
	sprite.play("hurt")

func switch_to_walk():
	sprite.play("walk")

func _physics_process(delta: float) -> void:
	if player:
		# Calculate direction and distance to the player
		var direction = global_position.direction_to(player.global_position)
		var distance = global_position.distance_to(player.global_position)

		if distance > min_distance:
			# Move towards the player if farther than min_distance
			velocity = direction * move_speed
			sprite.play("walk")
		else:
			# Stop moving if too close
			velocity = Vector2.ZERO
			sprite.play("hurt")  # Optional: Play an idle or "stuck" animation

		# Flip the sprite based on movement direction
		if direction.x > 0:  # Moving right
			sprite.flip_h = false
		elif direction.x < 0:  # Moving left
			sprite.flip_h = true

		# Apply movement
		move_and_slide()
