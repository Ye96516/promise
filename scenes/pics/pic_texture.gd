@tool
class_name PicTexture extends TextureRect

@onready var big_panel: Panel = %BigPanel
@onready var big_pic: TextureRect = %BigPic

func _ready() -> void:
	expand_mode=TextureRect.EXPAND_FIT_WIDTH
	connect("gui_input",_on_gui_input)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_released():
		big_pic.texture=texture
		big_panel.visible=true
