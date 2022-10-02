extends KinematicBody2D

var velocity = Vector2.ZERO
var UP = Vector2.UP

onready var playerState = $PlayerStateMachine
onready var active_state = playerState.state

var x_input

func _ready():
	print(active_state)

func _process(delta):
	x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	$Label.text = active_state

func apply_velocity(delta):
	velocity.y += 750*delta
	velocity = move_and_slide(velocity, UP)
	pass

func setPlayer_State(state : String):
	playerState.set_state(state)
