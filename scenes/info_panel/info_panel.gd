extends CanvasLayer

@onready var head: Label = %Head
@onready var stem: Label = %Stem
@onready var button: Button = %Button
@onready var button_2: Button = %Button2
@onready var button_3: Button = %Button3

"""
["A.飞机（直飞拉萨）", "金钱-1900", "时间+1", "健康-20", "觉醒值+5%"]
"""
var content_a:PackedStringArray
var content_b:PackedStringArray
var content_c:PackedStringArray
"""
["A&你决定选择飞机从北京出发前往西藏，快速进入高原导致严重高反&4", 
"B&你决定选择火车从北京出发前往西藏&2", 
"C&你决定选择自驾从北京出发前往西藏&3"]
"""
var about:PackedStringArray

func _ready() -> void:
	update_info(Global.current_ord-1)

func update_info(co:int):
	var data:Dictionary=Global.data[co]
	head.text=data["概括"]
	stem.text=data["题目"]
	about=data["关联"].split(";")
	
	var options:PackedStringArray=data["选项"].split(";")
	content_a=options[0].split("|")
	content_b=options[1].split("|")

	_set_button_content(button,content_a)
	_set_button_content(button_2,content_b)
	if options.size()!=2:
		button_3.visible=true
		content_c=options[2].split("|")
		_set_button_content(button_3,content_c)
	else:
		button_3.visible=false
		
#此函数专门用来适配按钮文本
func _set_button_content(btn: Button, parts: PackedStringArray) -> void:
	match parts.size():
		3:
			btn.text = "%s\n%s  %s" % [parts[0], parts[1], parts[2]]
		4:
			btn.text = "%s\n%s  %s\n%s" % [parts[0], parts[1], parts[2], parts[3]]
		5:
			btn.text = "%s\n%s  %s\n%s  %s" % [parts[0], parts[1], parts[2], parts[3], parts[4]]
		_:
			# 处理意外情况
			push_warning("Unexpected content size: %d for button %s" % [parts.size(), btn.name])
			btn.text = "\n".join(parts)

func _on_button_pressed() -> void:
	#content_a的示例
	#["A", "你决定选择飞机从北京出发前往西藏，快速进入高原导致严重高反", "4"]
	_handle_button_selection(content_a,0)
	
func _on_button_2_pressed() -> void:
	_handle_button_selection(content_a,1)
	
func _on_button_3_pressed() -> void:
	_handle_button_selection(content_a,2)

func _apply_effects(effects: Array) -> void:
	for effect in effects:
		match effect.substr(0, 2):
			"金钱": Global.gc += int(effect.substr(2))
			"时间": Global.date += int(effect.substr(2))
			"健康": Global.health += int(effect.substr(2))
			"觉醒": Global.wake+=int((effect.substr(3,-1)).reverse().substr(1).reverse())

# 通用的按钮处理逻辑
func _handle_button_selection(content_arr: Array, about_index: int) -> void:
	if Global.is_end:
		return
	if Global.current_ord==9:
		Global.is_end=true
		visible=false
	# 检查是否为"晚"选项
	if content_arr.size() > 1 && content_arr[1].ends_with("晚"):
		Global.rent=int(content_arr[1].reverse().substr(3,-1).reverse())
		print("租金为",Global.rent)
	Global.gc-=Global.rent
	# 从索引1开始跳过第一个文本元素
	var effects = content_arr.slice(1) 
	_apply_effects(effects)
	
	# 更新下一题信息
	var about_parts = about[about_index].split("&")
	if about_parts.size() >= 3:
		Global.current_ord=int(about_parts[2])
		var next_idx = Global.current_ord - 1
		update_info(next_idx)
