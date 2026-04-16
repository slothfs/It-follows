extends CharacterBody2D

@export var speed := 325
@export var gravity := 800
@export var jump_power := -400

var dead := false

func _physics_process(delta):
	if dead:
		return

	if not is_on_floor():
		velocity.y += gravity * delta

	var dir = Input.get_axis("left", "right")
	velocity.x = dir * speed

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power

	move_and_slide()

	for i in range(get_slide_collision_count()):
		var col = get_slide_collision(i).get_collider()
		if col and col.name.to_lower() == "shadow":
			die()


func die():
	if dead:
		return

	dead = true
	call_deferred("restart_game")


func restart_game():
	get_tree().reload_current_scene()
