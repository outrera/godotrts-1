extends "res://Builds/build.gd"

var cant_trabajadores = 3
var cant_trabajadores_activa = 0
var sueldo = 10

func _ready():
	nombre = "Mine"
	
	# ESTE CODIGO SE DEBE PASAR AL UPDATE CONSTANTE
	
	if global_var.poblacion >= cant_trabajadores:
		global_var.trabajadores += cant_trabajadores
		cant_trabajadores_activa = cant_trabajadores
	elif global_var.poblacion < cant_trabajadores:
		global_var.trabajadores += cant_trabajadores
		cant_trabajadores_activa = cant_trabajadores

func _process(delta):
	if $time_production.is_stopped():
		global_var.recursos["Oro"] -= sueldo*cant_trabajadores
		global_var.recursos["Piedra"] += 50
		$time_production.start()