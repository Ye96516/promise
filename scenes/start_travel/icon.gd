extends TextureRect

@export var target_scene:PackedScene
var ts:Node

func _ready() -> void:
	if target_scene:
	
		connect("gui_input",_gui_input)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_released():
			if is_instance_valid(ts):
				ts.visible=true
				return
			ts=target_scene.instantiate()
			owner.add_child(ts)
