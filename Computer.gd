extends CharacterBody2D

var SPEED = 150
const STARTING_POSITION = Vector2(632, 184)

func reset_position():
	global_position = STARTING_POSITION
	velocity = Vector2(0, 0)

func move_towards(target):
	var direction = 0
	if target.position.y < position.y:
		direction = -1
	if target.position.y > position.y:
		direction = 1
	velocity.y = direction * SPEED

func _physics_process(delta):
	move_and_slide()
