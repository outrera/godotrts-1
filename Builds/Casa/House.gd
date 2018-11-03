extends "res://Builds/build.gd"

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