extends Node2D


func _on_lvl_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("")
