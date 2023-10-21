extends CharacterBody2D

var SPEED = 150

func move_towards(target):
	var direction = 0
	if target.position.y < position.y:
		direction = -1
	if target.position.y > position.y:
		direction = 1
	velocity.y = direction * SPEED

func _physics_process(delta):
	move_and_slide()
