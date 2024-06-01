extends Node2D

@onready var tile_map = $tile_map
@onready var camera_2d = $player/Camera2D

func _ready():
	RoomsGlobals.rooms_to_be_created = randi_range(RoomsGlobals.min_rooms, RoomsGlobals.max_rooms)
	print(RoomsGlobals.rooms_to_be_created)
	create_rooms()
	camera_2d.update_camera(tile_map)

func create_rooms():
	randomize()
	var id = randi_range(1, 1)
	
	if(RoomsGlobals.rooms_to_be_created > 1):
		var s = load("res://scenes/sewer_rooms/room_" + str(id) + ".tscn").instantiate()
		s.position = $exit.position
		add_child(s)
		RoomsGlobals.rooms_to_be_created -= 1
