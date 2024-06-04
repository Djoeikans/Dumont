extends Node2D

@onready var tile_map = $tile_map
@onready var entrance = $entrance

func _on_entrance_body_entered(body):
	if(body.name == "player"):
		var camera = body.get_node("Camera2D")
		if(camera):
			camera.update_camera(tile_map)


func _on_exit_body_entered(body):
	if(body.name == "player"):
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/suburbio/suburbio.tscn")
