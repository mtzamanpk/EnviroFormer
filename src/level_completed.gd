extends ColorRect

signal restart()
signal quit()

@onready var quit_game = $CenterContainer/VBoxContainer/HBoxContainer/QuitGame
@onready var restart_game = $CenterContainer/VBoxContainer/HBoxContainer/RestartGame

func ready():
	pass

func _on_quit_game_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")


func _on_restart_game_pressed():
	print("restart")
