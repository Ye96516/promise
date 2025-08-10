extends Node2D

@export var bg:AudioStream

func _ready() -> void:
	if bg:
		AudioPlayer.play(bg,true)
