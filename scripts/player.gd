extends CharacterBody2D

#Character variables
@export_category("Variables")
@export var speed: float = 200.0
@onready var punch_collision = $punch/punch_collision as CollisionShape2D
var direction = Vector2.ZERO
var knockback_strength = 4000
var respawn_time = 0.7

#IMPORTANTE, SÓ É POSSÍVEL FAZER MODIFICAÇÕES NO ANIMATION PLAYER SE O ANIMATION TREE ESTIVER DESATIVADO, de nada
@onready var anim = $anim as AnimationPlayer
@onready var anim_tree = $anim_tree as AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")

enum player_states {MOVE, PUNCH, DEAD}
var current_states = player_states.MOVE

func _ready():
	punch_collision.disabled = true
	pass

func _process(delta):
	match current_states:
		player_states.MOVE:
			move()
		player_states.PUNCH:
			sword()
		player_states.DEAD:
			dead()

func move():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if(direction != Vector2.ZERO):
		#as 4 linhas abaixo servem para carregar as animações e definir as direções possível, sem isso a animação é tocada porém na direção do sprite base
		anim_tree.set("parameters/idle/blend_position", direction)
		anim_tree.set("parameters/walk/blend_position", direction)
		anim_tree.set("parameters/punch/blend_position", direction)
		anim_state.travel("walk")
		
		velocity = direction.normalized() * speed
	
	if(direction == Vector2.ZERO):
		anim_state.travel("idle")
		velocity = Vector2.ZERO
		
	if(Input.is_action_just_pressed("attack")):
		current_states = player_states.PUNCH
	
	if(player_data.life <= 0):
		current_states = player_states.DEAD
	
	move_and_slide()

func sword():
	anim_state.travel("punch")

func on_state_reset():
	current_states = player_states.MOVE
	
func dead():
	anim_state.travel("die")
	await get_tree().create_timer(respawn_time).timeout
	player_data.life = 4
	get_tree().reload_current_scene()
	
func apply_knockback(direction: Vector2) -> void:
	print("empurrou")
	print(direction)
	velocity = -direction * Vector2(knockback_strength, knockback_strength)
	move_and_slide()
