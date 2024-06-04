extends enemy_movement

func _ready():
	random_generation()

func _process(delta):
	pass

#Essa função chama a random generation da classe para pegar uma direção aleatória quando o timer expira, depois disso ela iniciar o timer novamente
func _on_timer_timeout():
	random_generation()
	$timer.start()

func _on_hitbox_area_entered(area):
	if(area.is_in_group("dumont_attack")):
		health -= 1
