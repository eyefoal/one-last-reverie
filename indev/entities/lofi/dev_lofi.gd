extends CharacterBody2D
class_name Lofi

@onready var weapon_reload: Timer = $WeaponReload
@onready var check_detection: Area2D = $CheckDetection
@export var tree : AnimationTree
@export var SPEED : float = 67.67
@export var current_weapon : PackedScene
var input
var playback : AnimationNodeStateMachinePlayback
var fire_direction : Vector2 = Vector2.RIGHT
var can_shoot := true

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
		
	velocity = input * SPEED
	
	move_and_slide()
	select_animation()
	dev_dialog()
	if weapon_reload.time_left > 0:
		can_shoot = false
	attack()
	animate()
	
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
