extends Node

var mouse = null
var posible = false
var recursos = {"Piedra": 100, "Madera": 200, "Oro": 2000, "Pan": 200, "Gente": 0}
var edificios = [load("res://Builds/Casa/Casa.tscn"),load("res://Builds/Mina/Mina.tscn"),load("res://Builds/Granja/Granja.tscn")]

var poblacion = 0
var trabajadores = 0

func _process(delta):
	if mouse == null:
		var newSprite = Sprite.new()
		newSprite.centered = false
		newSprite.texture = load("res://Graphics/PNG/Tiles/Terrain/Dirt/dirt_01.png")
		newSprite.z_index = 1
		add_child(newSprite)
		mouse = newSprite