extends Node2D

@onready var player: Player = $Player
@onready var teleport: Area2D = $teleport
@onready var fade: CanvasLayer = $Fade

func _on_teleport_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player.global_position = Vector2(640, 610)


func _on_lvl_body_entered(body: Node2D) -> void:
	if body.name == "Player":
			await fade.fade(1.0, 0.5). finished
			get_tree().change_scene_to_file("res://scenes/level/level_7.tscn")
