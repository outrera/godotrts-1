extends KinematicBody2D

var speed = 40
var pos_casa = Vector2()

var distance = Vector2()
var velocity = Vector2()
var direction = Vector2()

func _ready():
	pos_casa = get_parent().global_position

func _physics_process(delta):
	pass