extends Button

@export var target_scene:PackedScene

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(target_scene)
	pass # Replace with function body.
