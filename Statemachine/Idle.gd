extends Node

onready var parent = get_parent().get_parent()
onready var floorCast = parent.get_node("FloorCast")

func _physics_process(_delta):
	if parent.active_state == "Idle":
		logic(_delta)
		change_state()

func logic(_delta):
	parent.velocity.x = lerp(parent.velocity.x, 0, 0.25)
	pass

func change_state():
	if !floorCast.is_colliding():
		parent.setPlayer_State("Falling")
	elif parent.x_input != 0:
		parent.setPlayer_State("Running")
	elif Input.is_action_just_pressed("ui_accept"):
		parent.setPlayer_State("Jumping")
