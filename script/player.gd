class_name Player
extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_force: float = -500.0
@export var gravity: float = 1200

func _physics_process(delta):
	# Apply gravity (pull DOWN)
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Stop small floating on ground
		if velocity.y > 0:
			velocity.y = 0

	# l / r
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.x = direction * speed

	# Jump 
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force  # negative = up

	move_and_slide()

func die() -> void:
	get_tree().paused = true
	var death_screen: CanvasLayer = get_tree().current_scene.get_node("DeathScreen") as CanvasLayer
	death_screen.show()
