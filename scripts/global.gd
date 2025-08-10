extends Node

const CONFIGURATION = "res://data/config/Configuration.json"
var data:Array

#金币
var gc:int=8000
#健康
var health:int=80
#时间
var date:int=15
#觉醒值
var wake:int=0

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
		
