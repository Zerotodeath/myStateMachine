extends Node

onready var parent = get_parent().get_parent()
onready var floorCast = parent.get_node("FloorCast")

func _physics_process(delta):
	if parent.active_state == "Jumping":
		logic(delta)
		change_state()

func logic(delta):
	parent.velocity.y = -550
	
	if parent.x_input != 0 && parent.x_input != null:
		parent.velocity.x += parent.x_input * 1050 * delta
	else:
		parent.velocity.x = lerp(parent.velocity.x, 0, 0.1)
	
	parent.velocity.x = clamp(parent.velocity.x, -450, 450)
	pass

func change_state():
	parent.setPlayer_State("Falling")
