extends Control

@export var bg:AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if bg:
		AudioPlayer.play(bg)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
