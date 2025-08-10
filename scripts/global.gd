extends Node

signal update_value

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
var date:int=15:
	set(v):
		date=v
		update_value.emit()
#觉醒值
var wake:int=0:
	set(v):
		wake=v
		update_value.emit()

#当前消息序号
var current_info:int

func _ready() -> void:
	data=load_json_file(CONFIGURATION)["data"]
	#print(data)
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
		
