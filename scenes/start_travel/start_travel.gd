extends Control

@export var bg:AudioStream

@onready var time_wake_value: Label = %TimeWakeValue
@onready var money_health_value: Label = %MoneyHealthValue
@onready var scroll_content: RichTextLabel = %ScrollContent

func _ready() -> void:
	Global.connect("update_value",update_value)
	Global.connect("update_scroll_text",update_scroll_value)
	update_value()
	update_scroll_value()
	
	if bg:
		AudioPlayer.play(bg,true)

func update_value():
	time_wake_value.text="时间："+str(Global.date)+"\n"+"觉醒值："+str(Global.wake)+r"%"
	money_health_value.text="金钱："+str(Global.gc)+"\n"+"健康值："+str(Global.health)+r"\100"
	
func update_scroll_value():
	scroll_content.text=Global.scroll_text
