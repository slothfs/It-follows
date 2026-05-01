extends CharacterBody2D

@export var move_speed := 200.0
@export var jump_force := -450.0
@export var gravity := 900.0

var time_passed := 0.0
var direction := 1
var jump_timer := 0.0
var switch_timer := 0.0

func _physics_process(delta):
	time_passed += delta
	jump_timer += delta
	switch_timer += delta


	if not is_on_floor():
		velocity.y += gravity * delta

	
	if switch_timer > 2.5:
		direction *= -1
		switch_timer = 0.0

	velocity.x = direction * move_speed


	velocity.x += sin(time_passed * 3.0) * 80


	if jump_timer > 1.8 and is_on_floor():
		velocity.y = jump_force
		jump_timer = 0.0

	move_and_slide()
