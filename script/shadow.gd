extends CharacterBody2D

@export var speed: float = 180.0
@export var player_path: NodePath

var player_ref

func _ready():
	player_ref = get_node(player_path)

func _physics_process(delta):
	if player_ref == null:
		return

	var direction = (player_ref.global_position - global_position).normalized()
	velocity = direction * speed

	move_and_slide()


func _on_hurt_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		body.die()
