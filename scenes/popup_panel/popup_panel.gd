extends CanvasLayer

const initial_label_text:String="你是一个普通的城市白领，长期被工作压力和生活琐事困扰。某天，你偶然读到一本关于西藏的书，内心被深深触动，决定踏上一次西藏之旅，寻找内心的“苏醒”。"
const initial_button_text:String="开始旅行"
const result:Dictionary={
	"treatment":"你已危在旦夕，被强制住院。",
	"end1":"你理解了生命的真谛，带着新的心态回归生活。",
	"end2":"你感受到内心的平静，但尚未完全超脱，仍需继续探索。",
	"end3":"你只是完成了一次普通旅行，回到城市后依然迷茫。"
}

@onready var texture_rect: TextureRect = %TextureRect
@onready var label: Label = %Label
@onready var start: Button = %Start

func _ready() -> void:
	label.text=initial_label_text
	start.text=initial_button_text
	Global.connect("info_end",when_end)

func when_end():
	visible=true
	start.text="确定"
	print(Global.health)
	if Global.health<=30:
		label.text=result["treatment"]
		return
	final_info()

func final_info():
	if Global.wake>=80:
		label.text=result["end1"]
	elif Global.wake>=40 and Global.wake<80:
		label.text=result["end2"]
	elif Global.wake<40:
		label.text=result["end3"]
