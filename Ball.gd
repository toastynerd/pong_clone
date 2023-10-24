extends CharacterBody2D

const INCREASE = 10
const STARTING_POSITION = Vector2(320, 180)
var rng = RandomNumberGenerator.new()
@onready var bounce = $"../Bounce"

func get_direction():
	var direction_x = rng.randi_range(0, 1)
	var direction_y = rng.randi_range(0, 1)
	if direction_x == 0:
		direction_x = -1
	if direction_y == 0:
		direction_y = -1
	return Vector2(direction_x, direction_y)

func reset_position():
	var direction = get_direction()
	global_position = STARTING_POSITION
	velocity = Vector2(100, 100) * direction

func _ready():
	var direction = get_direction()
	velocity = Vector2(100, 100) * direction


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		bounce.play()
		if velocity.x > 0:
			velocity.x += INCREASE
		else:
			velocity.x -= INCREASE

		if velocity.y > 0:
			velocity.y += INCREASE
		else:
			velocity.y -= INCREASE
		velocity = velocity.bounce(collision_info.get_normal())
