extends CharacterBody2D
class_name Leanfi

@export var anim_player : AnimationPlayer
@export var tree : AnimationTree
@export var walk_speed :=  50.5
@export var speed : float = walk_speed
@export var sprint_speed : float = 100.5
@export var check_detection : Area2D
var input
var playback : AnimationNodeStateMachinePlayback
var currentCollider

func _ready() -> void:
	print("what a good day to be purple")
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
		#anim_player.speed_scale = 2.0
	else:
		#anim_player.speed_scale = 1.0
		speed = move_toward(speed, walk_speed, 2)
		
		
	velocity = input * speed
	
	move_and_slide()
	select_animation()


func select_animation():
	if velocity == Vector2.ZERO:
		playback.travel("Idle")
	else:
		playback.travel("Walk")
	
	if input: #This controls the blend position for the idle and walk states based on direction.
		var anim_direction = Vector2(round(input.x), round(input.y))
		tree.set("parameters/Idle/blend_position", anim_direction)
		tree.set("parameters/Walk/blend_position", anim_direction)


func _on_check_detection_area_entered(_area: Area2D) -> void:
		print("Check me out!")
