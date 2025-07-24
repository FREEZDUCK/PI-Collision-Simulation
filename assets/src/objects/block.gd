extends Area2D

@export var mass : float = 1
@export var velocity : float = 1
@export var fill_color : Color = Color(1, 1, 1, 1)

func _ready():
	var mass_text = $text
	
	if name == "collider":
		mass = Info.collider_mass
	
	$CR.color = fill_color
	var scale_of_mass = Vector2.ONE + Vector2(log(mass), log(mass)) * 0.14
	
	scale = scale_of_mass

	mass_text.text = format_number_with_commas(mass) + "kg"
	
	position.y -= 10 * scale_of_mass.x
	position.x += 10 * scale_of_mass.x
	
func format_number_with_commas(n: int) -> String:
	var s := str(n)
	var result := ""
	while s.length() > 3:
		result = "," + s.substr(s.length() - 3, 3) + result
		s = s.substr(0, s.length() - 3)
	result = s + result
	return result

func _process(delta):
	position.x += velocity * delta
	
func hit(pos : Vector2):
	var par_path = preload("res://assets/objects/hit_particle.tscn")
	var par = par_path.instantiate()
	get_tree().current_scene.add_child(par)
	par.global_position = pos
	par.emitting = true
	
	var sfx_path = preload("res://assets/objects/hit_sound.tscn")
	var sfx = sfx_path.instantiate()
	get_tree().current_scene.add_child(sfx)
	sfx.playing = true

func _on_area_entered(area):
	if name != "collidee":
		return
		
	get_tree().current_scene.hit_count += 1

	if area.name == "wall":
		velocity *= -1
		hit(global_position + Vector2(-10, 0))
		return
		
	hit(global_position + Vector2(5, 0))
	# 질량과 속도 가져오기
	var m1 = mass
	var v1 = velocity
	var m2 = area.mass
	var v2 = area.velocity
	
	# 완전 탄성 충돌 공식 적용
	var new_v1 = ((m1 - m2) * v1 + 2 * m2 * v2) / (m1 + m2)
	var new_v2 = ((m2 - m1) * v2 + 2 * m1 * v1) / (m1 + m2)

	# 속도 갱신
	velocity = new_v1
	area.velocity = new_v2
	
