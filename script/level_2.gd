extends Node2D


func _on_lvl_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		await fade.fade(1.0, 0.5). finished
		get_tree().change_scene_to_file("res://scenes/level/level_3.tscn")
		
