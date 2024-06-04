extends Node2D

@onready var tile_map = $tile_map
@onready var entrance = $entrance

func _ready():
	pass

func _on_entrance_body_entered(body):
	if(body.name == "player"):
		var camera = body.get_node("Camera2D")
		if(camera):
			camera.update_camera(tile_map)
