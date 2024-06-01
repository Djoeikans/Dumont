extends Camera2D

@onready var camera_2d = $"."
@onready var player = $".."
# Obtém o tamanho da grade de tiles em número de tiles
@export var cell_size = 16

func _ready():
	pass

func _process(delta):
	pass

func update_camera(tile_map):
	# Obtém os limites do TileMap em número de tiles
	var used_rect = tile_map.get_used_rect()

	# Calcula a largura e altura em pixels
	var tilemap_width = used_rect.size.x * cell_size
	var tilemap_height = used_rect.size.y * cell_size
	
	camera_2d.global_position = player.global_position
	
	# Define os limites da câmera em relação à posição global do TileMap
	camera_2d.limit_right = tile_map.global_position.x + tilemap_width
	camera_2d.limit_left = tile_map.global_position.x + used_rect.position.x * cell_size
	camera_2d.limit_top = tile_map.global_position.y + used_rect.position.y * cell_size
	camera_2d.limit_bottom = tile_map.global_position.y + (used_rect.position.y + used_rect.size.y) * cell_size
	
