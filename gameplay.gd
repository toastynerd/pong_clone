extends Node2D
var ball
var computer

# Called when the node enters the scene tree for the first time.
func _ready():
	ball = get_node("ball").get_node("Ball")
	computer = get_node("Computer").get_node("Paddle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	computer.move_towards(ball)
