extends Node
class_name StateMachine

var state = null
var previous_state = null
var states = {}

onready var parent = get_parent()

func _physics_process(delta):
	if state != null:
		_state_logic(delta)

func _state_logic(delta):
	pass

func enter_state(new_state, old_State):
	pass

func exit_state(old_state, new_state):
	pass

func set_state(new_state):
	previous_state = state
	state = new_state
	
	if previous_state != null:
		exit_state(previous_state, new_state)
	
	if new_state != null:
		enter_state(new_state, previous_state)
	pass

func addState(state_name):
	states[state_name] = state_name
	pass
