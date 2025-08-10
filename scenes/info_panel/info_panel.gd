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
	update_info(Global.current_info)

func update_info(co:int):
	var data:Dictionary=Global.data[co]
	head.text=data["概括"]
	stem.text=data["题目"]
	about=data["关联"].split(";")
	var content:PackedStringArray=data["选项"].split(";")
	content_a=content[0].split("|")
	content_b=content[1].split("|")
	print(content_a)
	if content.size()!=2:
		button_3.visible=true
		content_c=content[2].split("|")
		if content_c.size()==4:
			button_3.text=content_c[0]+"\n"+content_c[1]+"  "+content_c[2]+"\n"\
			+content_c[3]
		if content_c.size()==5:
			button_3.text=content_c[0]+"\n"+content_c[1]+"  "+content_c[2]+"\n"\
			+content_c[3]+"  "+content_c[4]
	else:
		button_3.visible=false
	if content_a.size()==4:
		button.text=content_a[0]+"\n"+content_a[1]+"  "+content_a[2]+"\n"\
		+content_a[3]
	if content_a.size()==5:
		button.text=content_a[0]+"\n"+content_a[1]+"  "+content_a[2]+"\n"\
		+content_a[3]+"  "+content_a[4]
	if content_b.size()==4:
		button_2.text=content_b[0]+"\n"+content_b[1]+"  "+content_b[2]+"\n"\
		+content_b[3]
	if content_b.size()==5:
		button_2.text=content_b[0]+"\n"+content_b[1]+"  "+content_b[2]+"\n"\
		+content_b[3]+"  "+content_b[4]

func _on_button_pressed() -> void:
	#["A", "你决定选择飞机从北京出发前往西藏，快速进入高原导致严重高反", "4"]
	var about_a=about[0].split("&")
	for i in content_a.size()-1:
		match content_a[i+1].substr(0,2):
			"金钱":
				Global.gc+=int(content_a[i+1].substr(2,-1))
			"时间":
				Global.date+=int(content_a[i+1].substr(2,-1))
			"健康":
				Global.health+=int(content_a[i+1].substr(2,-1))
			"觉醒":
				Global.wake+=int((content_a[i+1].substr(3,-1)).reverse().substr(1).reverse())
	update_info(int(about_a[2])-1)
	
func _on_button_2_pressed() -> void:
	var about_b=about[1].split("&")
	for i in content_b.size()-1:
		match content_b[i+1].substr(0,2):
			"金钱":
				Global.gc+=int(content_b[i+1].substr(2,-1))
			"时间":
				Global.date+=int(content_b[i+1].substr(2,-1))
			"健康":
				Global.health+=int(content_b[i+1].substr(2,-1))
			"觉醒":
				Global.wake+=int((content_b[i+1].substr(3,-1)).reverse().substr(1).reverse())
	update_info(int(about_b[2])-1)
	
func _on_button_3_pressed() -> void:
	var about_c=about[1].split("&")
	for i in content_c.size()-1:
		match content_c[i+1].substr(0,2):
			"金钱":
				Global.gc+=int(content_c[i+1].substr(2,-1))
			"时间":
				Global.date+=int(content_c[i+1].substr(2,-1))
			"健康":
				Global.health+=int(content_c[i+1].substr(2,-1))
			"觉醒":
				Global.wake+=int((content_c[i+1].substr(3,-1)).reverse().substr(1).reverse())
	update_info(int(about_c[2])-1)
