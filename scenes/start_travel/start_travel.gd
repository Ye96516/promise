extends Control

@export var bg:AudioStream

@export var time:int
@export var wake:int
@export var health:int
@export var gc:int

@onready var time_wake_value: Label = %TimeWakeValue
@onready var money_health_value: Label = %MoneyHealthValue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_wake_value.text="时间："+str(time)+"\n"+"觉醒值"+str(wake)+r"\100"
	money_health_value.text="金钱："+str(gc)+"\n"+"健康值"+str(health)+r"\100"
	if bg:
		AudioPlayer.play(bg)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
