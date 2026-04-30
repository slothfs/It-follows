extends Node2D




func _on_lvl_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/level/level_5.tscn")
