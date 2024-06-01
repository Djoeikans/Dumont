extends CanvasLayer

@onready var animation = $animation

func _ready():
	pass

func _process(delta):
	if(player_data.life == 3):
		animation.play("three_lifes")
	elif(player_data.life == 2):
		animation.play("two_lifes")
	if(player_data.life == 1):
		animation.play("one_life")
	if(player_data.life == 0):
		animation.play("no_life")
