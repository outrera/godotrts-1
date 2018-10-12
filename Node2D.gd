extends Node2D

export (int) var camera_speed

var pos
var pos_inicial = Vector2()

var array = PoolVector2Array()
var active = false
var pos_pasada = Vector2()

var ya = false

func _ready():
	pass

func _process(delta):
	update()
	pos = $"../Tilemaps/terrain".world_to_map(get_global_mouse_position())
	
	if global_var.mouse != null:
		global_var.posible = false
		for i in $"../Tilemaps/terrain".get_used_cells():
			if pos == i:
				global_var.mouse.global_position = pos * $"../Tilemaps/terrain".cell_size
				
				if ya:
					if Input.is_action_just_pressed("clic") and active == false:
						array.append(pos*$"../Tilemaps/terrain".cell_size+Vector2(60,70))
						active = true
					
					if global_var.mouse.global_position != pos_pasada and active == true:
						array.append(pos*$"../Tilemaps/terrain".cell_size+Vector2(60,70))
						print(array.size())
					
				pos_pasada = global_var.mouse.global_position
		
		# Para poner una mina
		if global_var.mouse.is_in_group("Mine"):
			for i in $"../Tilemaps/terrain".get_used_cells_by_id(6):
				if pos == i:
					global_var.posible = true
					break
		# Para poner una casa
		elif global_var.mouse.is_in_group("House"):
			for i in $"../Tilemaps/terrain".get_used_cells_by_id(0):
				if pos == i:
					global_var.posible = true
					break
		# Para poner una arqueria
		elif global_var.mouse.is_in_group("Archery"):
			for i in $"../Tilemaps/terrain".get_used_cells_by_id(5):
				if pos == i:
					global_var.posible = true
					break
		# Para poner una granja
		elif global_var.mouse.is_in_group("Granja"):
			for i in $"../Tilemaps/terrain".get_used_cells_by_id(0):
				if pos == i:
					global_var.posible = true
					break
	
	if Input.is_action_pressed("ui_up"):
		$camera.global_position.y -= camera_speed*delta
	elif Input.is_action_pressed("ui_down"):
		$camera.global_position.y += camera_speed*delta
	elif Input.is_action_pressed("ui_right"):
		$camera.global_position.x += camera_speed*delta
	elif Input.is_action_pressed("ui_left"):
		$camera.global_position.x -= camera_speed*delta

func _draw():
	if ya: 
		draw_polyline(array,Color(3,3,4,5),5)

func _on_Button_pressed():
	$camera.global_position.x += 100

func _on_Button2_pressed():
	$camera.global_position.x -= 100

func _on_Button3_pressed():
	$camera.global_position.y += 100

func _on_Button4_pressed():
	$camera.global_position.y -= 100
