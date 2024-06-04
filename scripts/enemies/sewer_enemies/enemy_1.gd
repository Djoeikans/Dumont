extends enemy_movement

@onready var wall_detector = $wall_detector
var raycast_size: float = 10.5

func _ready():
	random_generation()

func _process(delta):
	#baseado na direção que o inimigo anda, o raycast de identificação de paredes acompanha
	match current_states:
		enemy_states.MOVERIGHT:
			wall_detector.target_position = Vector2(raycast_size,0)
		enemy_states.MOVELEFT:
			wall_detector.target_position = Vector2(-raycast_size,0)
		enemy_states.MOVEUP:
			wall_detector.target_position = Vector2(0,-raycast_size)
		enemy_states.MOVEDOWN:
			wall_detector.target_position = Vector2(0,raycast_size)
	
	if(wall_detector.is_colliding()):
		random_generation()

#Essa função chama a random generation da classe para pegar uma direção aleatória quando o timer expira, depois disso ela iniciar o timer novamente
func _on_timer_timeout():
	random_generation()
	$timer.start()

func _on_hitbox_area_entered(area):
	if(area.is_in_group("dumont_attack")):
		health -= 1
		flash()
		knockback(area.get_parent().last_direction)

#Apllica um empurrão ao inimigo na direção contrária do player
func knockback(last_direction: Vector2):
	#usa-se o "last_direction" no caso do player estar com a velocidade igual a (0,0)
	var knockback_direction = last_direction * knockback_power
	velocity = knockback_direction
	move_and_slide()

#Essa função chama o shader e aumenta a opacidade dele no sprite para dar o efeito de dano
func flash():
	$texture.material.set_shader_parameter("flash_modifier", 0.9)
	await get_tree().create_timer(0.15).timeout
	$texture.material.set_shader_parameter("flash_modifier", 0)
