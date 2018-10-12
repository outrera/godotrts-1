extends Control

var in_build = null
var cont = 0

var actual_build = null

signal cambiar_datos

func _ready():
	visible = false
	connect("cambiar_datos",self,"_cambiar_datos_edificio")
	$Build/icon.texture = global_var.edificios[cont].instance().get_node("build/spr").texture
	_cambiar_datos_edificio()
	
	set_process(true)

func _process(delta):
	if global_var.mouse != null:
		if Input.is_mouse_button_pressed(2):
			if global_var.posible:
				actual_build.global_position = global_var.mouse.global_position
				actual_build = null
				global_var.mouse = null
				global_var.posible = false
	
	if in_build != null:
		$Builds.visible = false
		if global_var.mouse is Sprite:
			global_var.mouse.queue_free()
		global_var.mouse = in_build
		
		if Input.is_mouse_button_pressed(2) and global_var.posible:
			global_var.mouse = null
			in_build = null
			global_var.posible = false

func _construir():
	var newEdificio = null
	if global_var.recursos["Madera"] >= global_var.edificios[cont].instance().coste_madera and global_var.recursos["Piedra"] >= global_var.edificios[cont].instance().coste_piedra:
		newEdificio = global_var.edificios[cont].instance()
		get_parent().get_parent().get_node("Edificios").add_child(newEdificio)
		global_var.recursos["Madera"] += newEdificio.coste_madera
		global_var.recursos["Piedra"] += newEdificio.coste_piedra
		global_var.recursos["Gente"] += newEdificio.coste_gente
		global_var.mouse = newEdificio
		actual_build = newEdificio
	else:
		return

func _cambiar_datos_edificio():
	$Build/desc.text = global_var.edificios[cont].instance().desc
	$Build/costos/Piedra/Label.text = str((global_var.edificios[cont].instance().coste_piedra))
	$Build/costos/Madera/Label.text = str((global_var.edificios[cont].instance().coste_madera))
	$Build/costos/Gente/Label.text = str((global_var.edificios[cont].instance().coste_gente))
	$Build/comprar/text.text = str(global_var.edificios[cont].instance().precio)

func _hover():
	$hover/nombre.text = global_var.mouse_en

func _on_nov_iz_pressed():
	cont -= 1
	if cont < 0:
		cont = global_var.edificios.size()-1
	$Build/icon.texture = global_var.edificios[cont].instance().get_node("build/spr").texture
	emit_signal("cambiar_datos")

func _on_nov_der_pressed():
	cont += 1
	if cont == global_var.edificios.size():
		cont = global_var.edificios.size()-cont
	$Build/icon.texture = global_var.edificios[cont].instance().get_node("build/spr").texture
	emit_signal("cambiar_datos")

func _on_comprar_gui_input(ev):
	if ev is InputEventMouseButton:
		if ev.is_pressed():
			if global_var.recursos["Oro"] >= global_var.edificios[cont].instance().precio:
				_construir()
				visible = false

func _on_Build_pressed():
	if visible:
		visible = false
	else:
		visible = true
