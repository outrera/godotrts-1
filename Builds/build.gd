extends Node2D

export var level = 0
export var precio = 200
export var desc = ""

export var coste_gente = 0
export var coste_piedra = 0
export var coste_madera = 0

export var production = 1
export var wolkers = 5
export var nombre = "build"

signal click

# Posiciones de lineas de seleccion
var pos_inicial = Vector2(55,70)
var pos_fin = Vector2()

func _ready():
	$build.connect("mouse_entered",$"../../CanvasLayer/Info","_hover")
	$Container/Construir.connect("pressed",$"../../CanvasLayer/Info","construir")

func _process(delta):
	update()

func _draw():
	#draw_line(Vector2(58,70),Vector2(60,70),Color(3,4,5,6),5)
	draw_line(pos_inicial,Vector2(60,70),Color(3,4,5,6),5)

func _on_build_mouse_entered():
#	emit_signal("click")
#	print(get_global_mouse_position().angle_to_point($build.global_position+Vector2(60,70)))
	global_var.mouse_en = nombre
	print(nombre)
	pass

#func _on():
#	print("Heelooooooijoijo")
