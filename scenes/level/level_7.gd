extends Node2D

@onready var player: Player = $Player
@onready var fade: CanvasLayer = $Fade


func _on_lvl_body_entered(body: Node2D) -> void:
	if body.name == "Player":
			await fade.fade(1.0, 0.5). finished
			get_tree().reload_current_scene()
