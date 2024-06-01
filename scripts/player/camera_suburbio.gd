extends Camera2D

@onready var camera_2d = $"."
@onready var background = $"../../background"
@onready var player = $".."

#quando a câmera é carregada ela põe seus limites baseados na posição do backgound, assim não precisa colocar a mão
func _ready():
	pass
