extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var teleport: Area2D = $teleport
@onready var fade: CanvasLayer = $Fade





func _on_teleport_body_entered(body):
	if body.name == "Player":
		player.global_position = Vector2(1060, 595)
	


func _on_lvl_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		await fade.fade(1.0, 0.5). finished
		get_tree().change_scene_to_file("res://scenes/level/level_5.tscn")
