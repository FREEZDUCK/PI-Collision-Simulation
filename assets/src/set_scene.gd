extends Node2D

func _on_button_pressed():
	if $center/V/V/input.text == "":
		Info.collider_mass = 1
	else:
		Info.collider_mass = float($center/V/V/input.text)
		
	get_tree().change_scene_to_file("res://assets/scenes/main_scene.tscn")
