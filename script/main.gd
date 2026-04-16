extends Node2D

@onready var player = $player
@onready var shadow = $shadow

var positions := []
var delay := 90
var shadow_target := Vector2.ZERO

func _process(delta):
	positions.append(player.global_position)

	if positions.size() > delay:
		shadow_target = positions.pop_front()

	shadow.global_position = shadow.global_position.lerp(shadow_target, 0.2)
