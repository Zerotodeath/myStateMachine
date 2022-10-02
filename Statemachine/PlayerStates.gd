extends StateMachine


func _ready():
	addState("Idle")
	addState("Running")
	addState("Jumping")
	addState("Falling")
	call_deferred("set_state", states.Idle)
	

func _state_logic(delta):
	parent.active_state = state
	parent.apply_velocity(delta)
