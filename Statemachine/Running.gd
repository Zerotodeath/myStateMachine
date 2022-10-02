extends Node

onready var parent = get_parent().get_parent()
onready var floorCast = parent.get_node("FloorCast")

func _physics_process(delta):
	if parent.active_state == "Running":
		logic(delta)
		change_state()

func logic(delta):
	parent.velocity.x += parent.x_input * 1500 * delta
	
	parent.velocity.x = clamp(parent.velocity.x, -450, 450)
	pass

func change_state():
	if !floorCast.is_colliding():
		parent.setPlayer_State("Falling")
	elif Input.is_action_just_pressed("ui_accept"):
		parent.setPlayer_State("Jumping")
	elif !Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		parent.setPlayer_State("Idle")
