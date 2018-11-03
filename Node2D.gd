extends Node2D

export (int) var camera_speed

var pos
var active = false

func _ready():
	pass

func _process(delta):
	pos = $"../Tilemaps/terrain".world_to_map(get_global_mouse_position())
	
	if global_var.mouse != null:
		global_var.posible = false
		for i in $"../Tilemaps/terrain".get_used_cells():
			if pos == i:
				global_var.mouse.global_position = pos * $"../Tilemaps/terrain".cell_size
		
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

func _on_Button_pressed():
	$camera.global_position.x += 100

func _on_Button2_pressed():
	$camera.global_position.x -= 100

func _on_Button3_pressed():
	$camera.global_position.y += 100

func _on_Button4_pressed():
	$camera.global_position.y -= 100
