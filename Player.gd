extends CharacterBody2D

const SPEED = 200

func get_input():
	var input_direction = Input.get_axis("up", "down")
	velocity.y = input_direction * SPEED

func _physics_process(delta):
	get_input()
	move_and_slide()
