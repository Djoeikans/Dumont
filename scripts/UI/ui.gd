extends CanvasLayer

@onready var animation_life = $animation_life
@onready var gear_counter = $gear_counter

func _ready():
	pass

func _process(delta):
	if(player_data.life == 3):
		animation_life.play("three_lifes")
	elif(player_data.life == 2):
		animation_life.play("two_lifes")
	if(player_data.life == 1):
		animation_life.play("one_life")
	if(player_data.life == 0):
		animation_life.play("no_life")
	
	#é necessário mudar o tipo de variável de inteiro para string para funcionar com o ".text"
	gear_counter.text = var_to_str(player_data.coin)
