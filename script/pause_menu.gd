extends CanvasLayer


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible =  true
			get_tree().paused = true


func _ready() -> void:
	visible = false
	get_tree().paused = false
	
func _on_resume_pressed() -> void:
	visible = false
	get_tree().paused = false


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_skip_pressed() -> void:
	pass # Replace with function body.


func _on_skip_2_pressed() -> void:
	pass # Replace with function body.


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
