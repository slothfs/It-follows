extends CharacterBody2D

@export var speed := 325
@export var gravity := 800
@export var jump_power := -400

var dead := false
var screen_width := 0.0

# 🔥 REAL POSITION (never resets)
var real_position := Vector2.ZERO


func _ready():
	screen_width = get_viewport_rect().size.x
	real_position = global_position


func _physics_process(delta):
	if dead:
		return

	# gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# movement
	var dir = Input.get_axis("left", "right")
	velocity.x = dir * speed

	# jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power

	move_and_slide()

	# 🔥 update REAL position manually
	real_position += velocity * delta

	# 🔥 visual wrap only
	wrap_visual()

	# death check
	for i in range(get_slide_collision_count()):
		var col = get_slide_collision(i).get_collider()
		if col and col.name == "Shadow":
			die()


func wrap_visual():
	var x = real_position.x

	if x < 0:
		global_position.x = fmod(x, screen_width) + screen_width
	else:
		global_position.x = fmod(x, screen_width)


func die():
	if dead:
		return

	dead = true
	call_deferred("restart_game")


func restart_game():
	get_tree().reload_current_scene()
