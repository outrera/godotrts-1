extends NinePatchRect

signal abrir
var pos_inicio = Vector2()

func _ready():
	pos_inicio = rect_position
	self.connect("gui_input",self,"_clic")
	
func _process(delta):
	for i in global_var.recursos:
		if i == get_name():
			$text.text = str(global_var.recursos[i])

func _clic(ev):
	if ev is InputEventMouseButton:
		if ev.is_pressed():
			if !get_parent() is NinePatchRect:
				if rect_position.x == pos_inicio.x+70:
					rect_position.x -= 70
				elif rect_position.x == pos_inicio.x:
					rect_position.x += 70
			