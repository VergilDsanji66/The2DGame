extends CharacterBody2D

@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var gun_shot: AudioStreamPlayer2D = $GunShot

#@onready var mob_death_sfx: AudioStreamPlayer2D = $MobDeathSFX
@onready var sprite = $AnimatedSprite2D  # Adjust path if necessary
var player  # Reference to the player or target node
var min_distance = 20.0  # Minimum distance before stopping
var move_speed = 100.0  # Movement speed of the enemy
var health = 20

func _ready():
	# Set the initial animation
	sprite.play("walk")
	player = get_parent().get_node("Player")  # Adjust the path to your player node

func take_damage():
	#mob_death_sfx.play()
	gun_shot.play()
	health -= 1
	if health == 0:
		game_manager.add_point()     #label for score counter
		animation_player.play("mobdeath")  #sound when mobs die
		#queue_free()
	else:
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

func _on_body_entered(body: Node2D) -> void:
	  #How many mobs where killed
	
	if body == player:  # Check if the body is the player
		if player.has_method("take_damage"):
			player.take_damage()  # Inflict damage on the player
	else:
		if body.has_method("take_damage"):
			body.take_damage()  # Damage other objects if needed
