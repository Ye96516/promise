extends CanvasLayer

@onready var head: Label = %Head
@onready var stem: Label = %Stem
@onready var button: Button = %Button
@onready var button_2: Button = %Button2
@onready var button_3: Button = %Button3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_info(Global.current_info)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_info(co:int):
	var data:Dictionary=Global.data[co]
	head.text=data["概括"]
	stem.text=data["题目"]
	var content:PackedStringArray=data["选项"].split(";")
	var content_a:PackedStringArray=content[0].split("|")
	var content_b:PackedStringArray=content[1].split("|")
	if content.size()!=2:
		var content_c:PackedStringArray=content[2].split("|")
		if content_c.size()==4:
			button_3.text=content_c[0]+"\n"+content_c[1]+"  "+content_c[2]+"\n"\
			+content_c[3]
		if content_c.size()==5:
			button_3.text=content_c[0]+"\n"+content_c[1]+"  "+content_c[2]+"\n"\
			+content_c[3]+"  "+content_c[4]
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
	
	print(content)
	pass
