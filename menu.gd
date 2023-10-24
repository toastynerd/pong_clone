extends Node2D


@onready var titleMusic = $TitleMusic
@onready var hoverQuitSfx = $HoverQuitSfx
@onready var hoverPlaySfx = $HoverPlaySfx
@onready var startGame = $StartGame

func _ready():
	titleMusic.play()

func _on_play_pressed():
	titleMusic.stop()
	startGame.play()
	await startGame.finished
	get_tree().change_scene_to_file("res://gameplay.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_play_mouse_entered():
	hoverPlaySfx.play()


func _on_quit_mouse_entered():
	hoverQuitSfx.play()
