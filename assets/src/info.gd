extends Node

var full_screen := false
var collider_mass : float = 1

func _process(delta):
	if Input.is_action_just_pressed("full_screen"):
		if full_screen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		full_screen = !full_screen
