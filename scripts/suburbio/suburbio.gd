extends Node2D

var pause_time: float = 1.5

func _ready():
	pass

func _on_suburbio_exit_body_entered(body):
	if(body.name == "player"):
		await get_tree().create_timer(pause_time).timeout
		get_tree().change_scene_to_file("res://scenes/sewer_rooms/sewer_initial_room.tscn")
