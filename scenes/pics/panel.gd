extends Panel

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_released():
		visible=!visible
