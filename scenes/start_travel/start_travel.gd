extends Control

@export var bg:AudioStream

@onready var time_wake_value: Label = %TimeWakeValue
@onready var money_health_value: Label = %MoneyHealthValue
@onready var scroll_content: RichTextLabel = %ScrollContent

@onready var sl:SLSystem=SLSystem.new()

func _ready() -> void:
	load_data()
	update_value()
	update_scroll_value()
	Global.connect("update_value",update_value)
	Global.connect("update_scroll_text",update_scroll_value)
	if bg:
		AudioPlayer.play(bg,true)

func update_value():
	sl.save_data("时间",Global.date)
	sl.save_data("金钱",Global.gc)
	sl.save_data("觉醒值",Global.wake)
	sl.save_data("健康值",Global.health)
	time_wake_value.text="时间："+str(Global.date)+"\n"+"觉醒值："+str(Global.wake)+r"%"
	money_health_value.text="金钱："+str(Global.gc)+"\n"+"健康值："+str(Global.health)+r"\100"
	
func update_scroll_value():
	sl.save_data("scroll_text",Global.scroll_text)
	scroll_content.text=Global.scroll_text

func load_data():
	if sl.load_data("时间"):
		Global.date=sl.load_data("时间")
	if sl.load_data("金钱"):
		Global.gc=sl.load_data("金钱")
	if sl.load_data("觉醒值"):
		Global.wake=sl.load_data("觉醒值")
	if sl.load_data("健康值"):
		Global.health=sl.load_data("健康值")
	if sl.load_data("scroll_text"):
		Global.scroll_text=sl.load_data("scroll_text")
