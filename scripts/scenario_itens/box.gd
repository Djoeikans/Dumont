extends StaticBody2D

@onready var anim = $anim
@onready var explosion_area = $explosion_area
@onready var explosion_timer = $explosion_area/explosion_timer

@onready var exploded = false

func _ready():
	explosion_area.monitoring = false

func _process(delta):
	pass

func _on_box_hitbox_area_entered(area):
	if(area.name == "sword"):
		anim.play("destroy")
		explosion_timer.start()
		explosion_area.monitoring = true

func _on_explosion_timer_timeout():
	queue_free()

func _on_explosion_area_body_entered(body):
	if(body.name == "player"):
		body.apply_knockback(body.last_direction)
