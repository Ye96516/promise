extends Control

@export var bg:AudioStream

@onready var time_wake_value: Label = %TimeWakeValue
@onready var money_health_value: Label = %MoneyHealthValue

func _ready() -> void:
	updata_value()
	
	if bg:
		AudioPlayer.play(bg,true)

func updata_value():
	time_wake_value.text="时间："+str(Global.date)+"\n"+"觉醒值："+str(Global.wake)+r"%"
	money_health_value.text="金钱："+str(Global.gc)+"\n"+"健康值："+str(Global.health)+r"\100"
	
