extends Node2D

var hit_count : int = 0
var simul_speed : float = 1

func _physics_process(delta):
	Engine.time_scale = simul_speed
	
	$hit_count.text = "충돌 횟수ㅣ" + str(hit_count) + "회\n시뮬레이션 배속ㅣ" + str(simul_speed) + "배"

func _process(delta):
	if Input.is_action_pressed("speed_up"):
		simul_speed += 0.5
	elif Input.is_action_pressed("speed_down"):
		if simul_speed >= 1:
			simul_speed -= 0.5
	elif Input.is_action_just_pressed("speed_reset"):
		simul_speed = 1
	elif Input.is_action_just_pressed("back"):
		get_tree().change_scene_to_file("res://assets/scenes/set_scene.tscn")
