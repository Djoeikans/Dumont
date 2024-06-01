extends Node2D

@onready var tile_map = $tile_map
@onready var entrance = $entrance

func _ready():
	await get_tree().create_timer(0.5).timeout
	create_rooms()
	pass

func create_rooms():
	randomize()
	var id = randi_range(RoomsGlobals.first_room_id, RoomsGlobals.last_room_id)
	
	if(RoomsGlobals.rooms_to_be_created > 1):
		var s = load("res://scenes/sewer_rooms/room_" + str(id) + ".tscn").instantiate()
		s.position = $exit.position
		add_child(s)
		RoomsGlobals.rooms_to_be_created -= 1
	else:
		var s = load("res://scenes/sewer_rooms/exit_room.tscn").instantiate()
		s.position = $exit.position
		add_child(s)

func _on_entrance_body_entered(body):
	if(body.name == "player"):
		var camera = body.get_node("Camera2D")
		if(camera):
			camera.update_camera(tile_map)
			print("limite pra direita: ", camera.limit_right)
