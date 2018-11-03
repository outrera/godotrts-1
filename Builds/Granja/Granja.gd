extends "res://Builds/build.gd"

var cant_trabajadores = 9
var cant_trabajadores_activa = 0
var sueldo = 12

func _ready():
	nombre = "Granja"
	
	if global_var.poblacion >= cant_trabajadores:
		global_var.trabajadores += cant_trabajadores
		cant_trabajadores_activa = cant_trabajadores
	elif global_var.poblacion < cant_trabajadores:
		global_var.trabajadores += cant_trabajadores
		cant_trabajadores_activa = cant_trabajadores
		
		# EN UN FUTURO ESTE CODIGO EJECUTARA ANIMACIONES DE ALERTAS
		print("¡¡NECESITAMOS MÀS GENTE!!")

func _process(delta):
	if $time_production.is_stopped():
		global_var.recursos["Oro"] -= sueldo*cant_trabajadores
		global_var.recursos["Pan"] += 100
		$time_production.start()