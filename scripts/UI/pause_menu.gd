extends CanvasLayer

#IMPORTANTE, o canvas layer tem a propriedade Process -> mode como Always porque independente do jogo pausar ou não ele continua funcionando
@onready var resume_btn = $menu_holder/resume_btn

func _ready():
	visible = false


func _process(delta):
	pass

func _unhandled_input(event):
	if(event.is_action_pressed("ui_cancel")):
		visible = true
		get_tree().paused = true
		resume_btn.grab_focus()

func _on_resume_btn_button_up():
	get_tree().paused = false
	visible = false

func _on_back_to_menu_btn_button_up():
	#é necessário despausar antes de mudar de cena
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")

func _on_quit_game_btn_button_up():
	get_tree().quit()

