extends CanvasLayer

func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED




func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	
