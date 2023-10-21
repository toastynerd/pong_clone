extends CharacterBody2D

const SPEED = 200
const START_LOCATION = Vector2(8, 190)

func reset_position():
	global_position = START_LOCATION
	velocity = Vector2()

func get_input():
	var input_direction = Input.get_axis("up", "down")
	velocity.y = input_direction * SPEED

func _physics_process(delta):
	get_input()
	move_and_slide()
