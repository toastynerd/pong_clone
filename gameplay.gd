extends Node2D
var ball
var computer
var player
var player_score = 0
var player_score_label
var computer_score = 0
var computer_score_label

@onready var music = $TitleMusic
@onready var point = $Point
@onready var win = $Win
@onready var lose = $Lose

func reset_position():
	ball.reset_position()
	player.reset_position()
	computer.reset_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	ball = get_node("Ball").get_node("Ball")
	computer = get_node("Computer").get_node("Paddle")
	computer_score_label = get_node("Computer Score")
	computer_score_label.set_text(str(computer_score))
	player = get_node("Player").get_node("Paddle")
	player_score_label = get_node("Player Score")
	player_score_label.set_text(str(player_score))
	music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	computer.move_towards(ball)


func _on_computer_goal_body_entered(body):
	point.play()
	computer_score += 1
	if computer_score == 5:
		music.stop()
		lose.play()
		await lose.finished
		get_tree().change_scene_to_file("res://lose.tscn")
	computer_score_label.set_text(str(computer_score))
	reset_position()


func _on_player_goal_body_entered(body):
	point.play()
	player_score += 1
	if player_score == 5:
		music.stop()
		win.play()
		await win.finished
		get_tree().change_scene_to_file("res://win.tscn")
	player_score_label.set_text(str(player_score))
	reset_position()
