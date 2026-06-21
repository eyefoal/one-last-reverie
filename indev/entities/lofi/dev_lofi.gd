extends CharacterBody2D
class_name Lofi

@onready var push_timer: Timer = $PushTimer
@onready var weapon_reload: Timer = $WeaponReload
@onready var check_detection: Area2D = $CheckDetection
@export var anim_player : AnimationPlayer
@export var tree : AnimationTree
@export var walk_speed :=  50.5
@export var speed : float = walk_speed
@export var sprint_speed : float = 100.5
@export var current_weapon : PackedScene
var input
var playback : AnimationNodeStateMachinePlayback
var fire_direction : Vector2 = Vector2.RIGHT
var can_shoot := true
var currentCollider

func _ready() -> void:
	print("it sure is boring around here")
	playback = tree["parameters/playback"]

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("a"):
		var interactables = check_detection.get_overlapping_areas()
		if interactables.size() > 0:
			interactables[0].interact()
		else:
			return

func _physics_process(_delta: float) -> void:
	input = Input.get_vector("left", "right", "up", "down")
	
	
	if Input.is_action_pressed("b"): #sprinting 
		speed = move_toward(speed, sprint_speed, 1)
		anim_player.speed_scale = 2.0
	else:
		anim_player.speed_scale = 1.0
		speed = walk_speed
		
	velocity = input * speed
	
	move_and_slide()
	select_animation()
	dev_dialog()
	if weapon_reload.time_left > 0:
		can_shoot = false
	attack()
	animate()
	
	var isColliding = move_and_slide()
	
	if isColliding and input:
		if push_timer.is_stopped():
			push_timer.start()
		currentCollider = get_last_slide_collision().get_collider()
	else:
		push_timer.stop()
	
func dev_dialog():
	if Input.is_action_just_pressed('dev01'):
		print("yawn")
		#DialogueManager.show_dialogue_balloon(load("res://dev/dialogue/devdiary08.dialogue"), "start")

func _on_check_detection_area_entered(area: Area2D) -> void:
	if area is Interactable and Input.is_action_just_pressed("a"):
		area.interact()
		print("Check me out!")
		
func select_animation():
	if velocity == Vector2.ZERO:
		playback.travel("Idle")
	else:
		playback.travel("Walk")
	
func animate():
	
	if input: #This controls the blend position for the idle and walk states based on direction.
		var anim_direction = Vector2(round(input.x), round(input.y))
		tree.set("parameters/Idle/blend_position", anim_direction)
		tree.set("parameters/Walk/blend_position", anim_direction)

func attack():
	var input_dir : Vector2 = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()
	
	if input_dir.x != 0.0:
		fire_direction.x = input_dir.x
		
	if Input.is_action_just_pressed("b") and current_weapon and can_shoot:
		weapon_reload.start()
		var final_dir : Vector2 = fire_direction
		if input_dir.y != 0 and input_dir.x == 0:
			final_dir.x = 0
		final_dir.y = input_dir.y
		var bullet_instance = current_weapon.instantiate() as Bullet
		bullet_instance.setup(position, final_dir.normalized())
		get_parent().add_child(bullet_instance)
		print(current_weapon)

func _on_weapon_reload_timeout() -> void:
	can_shoot = true

func _on_push_timer_timeout() -> void:
	if currentCollider is PushableBlock:
		currentCollider.push_block(input)
