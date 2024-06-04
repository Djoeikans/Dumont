extends Node2D

@onready var tile_map = $tile_map
@onready var camera_2d = $player/Camera2D
@onready var exit = $exit  # Adicione a referência ao nó de saída

func _ready():
	RoomsGlobals.rooms_to_be_created = randi_range(RoomsGlobals.min_rooms, RoomsGlobals.max_rooms)
	randomize()  # Certifique-se de randomizar apenas uma vez no início
	create_rooms()
	camera_2d.update_camera(tile_map)
	print(RoomsGlobals.rooms_to_be_created)

func create_rooms():
	var current_exit_position = $exit.position
	
	while RoomsGlobals.rooms_to_be_created > 0:
		var id = randi_range(RoomsGlobals.first_room_id, RoomsGlobals.last_room_id)
		var scene_path = "res://scenes/sewer_rooms/room_" + str(id) + ".tscn"
		
		if RoomsGlobals.rooms_to_be_created == 1:
			scene_path = "res://scenes/sewer_rooms/exit_room.tscn"
		
		var s = load(scene_path).instantiate()
		s.position = current_exit_position  # Posicione a nova sala na posição de saída da sala atual
		add_child(s)
		
		# Atualize a posição de saída para a nova sala
		current_exit_position = s.get_node("exit").position + s.position
		
		RoomsGlobals.rooms_to_be_created -= 1
