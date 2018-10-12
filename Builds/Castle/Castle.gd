extends "res://Builds/build.gd"

var clic = false

func _ready():
	pass

func _input(event):
	if clic and event.is_action_pressed("clic"):
		if $Container.visible:
			$Container.visible = false
		else:
			$Container.visible = true
#	elif event.is_action_pressed("clic") and $Container.visible:
#		$Container.visible = false
	
func _on_build_mouse_entered():
	clic = true
	global_var.mouse_en = get_name()

func _on_build_mouse_exited():
	clic = false

func _on_Construir_pressed():
	pass # replace with function body
