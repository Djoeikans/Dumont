extends Area2D

func _on_body_entered(body):
	if(body.name == "player"):
		player_data.coin += 1
		player_data.life -= 1
		queue_free()
