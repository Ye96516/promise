extends Node

signal update_value
signal update_scroll_text

const CONFIGURATION = "res://data/config/Configuration.json"
var data:Array

#金币
var gc:int=8000:
	set(v):
		gc=v
		update_value.emit()
#健康
var health:int=80:
	set(v):
		health=v
		update_value.emit()
#时间
var date:int=0:
	set(v):
		date=v
		update_value.emit()
#觉醒值
var wake:int=0:
	set(v):
		wake=v
		update_value.emit()
#滚动条文本
var scroll_text:String="由于长期被工作压力和生活琐事困扰，你决定来一场说走就走的旅程。":
	set(v):
		scroll_text=v
		update_scroll_text.emit()
#租金
var rent:int=0
#是否结束
var is_end:=false

#当前消息序号
var current_ord:int=1

func _ready() -> void:
	data=load_json_file(CONFIGURATION)["data"]

func load_json_file(path:String):
	if FileAccess.file_exists(path):
		var read_file=FileAccess.open(path,FileAccess.READ)
		var paresd_file=JSON.parse_string(read_file.get_as_text())
		if paresd_file is Dictionary:
			return paresd_file
		else:
			printerr("出现错误，该数据不为字典")
	else:
		printerr("文件路径错误")
		
