extends "res://Builds/build.gd"

# 0 = Dinero; 1 = Piedra; 2 = Madera;
var habitantes = 4
var renta = 10

func _ready():
	global_var.recursos["Gente"] += habitantes
	nombre = "Casa"

func _process(delta):
	if $time_production.is_stopped():
		global_var.recursos["Oro"] += renta
		global_var.recursos["Pan"] -= 20
		$time_production.start()
	
	if global_var.crias:
		habitantes += 1
		global_var.recursos["Gente"] += 1