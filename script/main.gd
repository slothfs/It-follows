extends Node2D

@onready var player = $Player
@onready var shadow = $Shadow
@onready var shadow_left = $ShadowLeft
@onready var shadow_right = $ShadowRight

var positions: Array[Vector2] = []
var shadow_target := Vector2.ZERO

var screen_width := 0.0
var time_passed := 0.0


func _ready():
	screen_width = get_viewport_rect().size.x


func _process(delta):
	time_passed += delta

	var delay := 120
	var lerp_speed := 0.2

	if time_passed < 6:
		delay = 120
		lerp_speed = 0.15
	elif time_passed < 10:
		delay = 70
		lerp_speed = 0.25
	else:
		delay = 35
		lerp_speed = 0.4


	
	positions.append(player.real_position)

	if positions.size() > delay:
		shadow_target = positions.pop_front()



	shadow.global_position = shadow.global_position.lerp(shadow_target, lerp_speed)



	shadow_left.global_position = shadow.global_position + Vector2(-screen_width, 0)
	shadow_right.global_position = shadow.global_position + Vector2(screen_width, 0)



	var d_main = player.global_position.distance_to(shadow.global_position)
	var d_left = player.global_position.distance_to(shadow_left.global_position)
	var d_right = player.global_position.distance_to(shadow_right.global_position)

	shadow.visible = d_main <= d_left and d_main <= d_right
	shadow_left.visible = d_left < d_main and d_left <= d_right
	shadow_right.visible = d_right < d_main and d_right < d_left
