extends Node

export(String) var state
onready var parent = get_parent().get_parent()


func _physics_process(delta):
	if parent.active_state == state:
		logic(delta)
		change_state()

func logic(delta):
	pass

func change_state():
	pass
