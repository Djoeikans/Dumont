extends CharacterBody2D
class_name enemy_movement

var current_states = enemy_states.MOVEDOWN
enum enemy_states {MOVERIGHT, MOVELEFT, MOVEUP, MOVEDOWN, DEAD}

@onready var gear_loot = preload("res://scenes/itens/coin.tscn")
@onready var dead_anim = preload("res://scenes/effects/dead_fx.tscn")
@export var speed: int = 30
@export var health: int = 3
@export var knockback_power: int = 1000
var gear_drop_porcentage: int = 60
var dir

func _physics_process(delta):
	if(health <= 0):
		current_states = enemy_states.DEAD

	match current_states:
		enemy_states.MOVERIGHT:
			move_right()
		enemy_states.MOVELEFT:
			move_left()
		enemy_states.MOVEUP:
			move_up()
		enemy_states.MOVEDOWN:
			move_down()
		enemy_states.DEAD:
			dead()
	
	move_and_slide()

func random_generation():
	dir = randi() % 4
	random_direction()
	
func random_direction():
	match dir:
		0:
			current_states = enemy_states.MOVERIGHT
		1:
			current_states = enemy_states.MOVELEFT
		2:
			current_states = enemy_states.MOVEUP
		3:
			current_states = enemy_states.MOVEDOWN

func dead():
	dead_animation()
	queue_free()

func dead_animation():
	var dead = dead_anim.instantiate()
	dead.global_position = global_position
	get_tree().get_root().add_child(dead)
	loot_gear()
	
func loot_gear():
	var draw_number = randf() * 100
	if(draw_number > gear_drop_porcentage):
		var gear = gear_loot.instantiate()
		gear.global_position = global_position
		get_tree().get_root().add_child(gear)

func move_right():
	velocity = Vector2.RIGHT * speed
	$anim.play("move_right")

func move_left():
	velocity = Vector2.LEFT * speed
	$anim.play("move_left")

func move_up():
	velocity = Vector2.UP * speed
	$anim.play("move_up")

func move_down():
	velocity = Vector2.DOWN * speed
	$anim.play("move_down")

