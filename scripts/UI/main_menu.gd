extends CanvasLayer

func _ready():
	pass # Replace with function body.

func _on_play_bttn_button_up():
	get_tree().change_scene_to_file("res://scenes/suburbio/suburbio.tscn")

func _on_credits_bttn_button_up():
	get_tree().change_scene_to_file("res://scenes/UI/credits.tscn")

func _on_quit_bttn_button_up():
	get_tree().quit()
