extends Node2D



func _on_area_2d_body_entered(body: Node2D) -> void:
		await fade.fade(1.0, 0.5). finished
		get_tree().change_scene_to_file("res://scenes/level/level_4.tscn")
