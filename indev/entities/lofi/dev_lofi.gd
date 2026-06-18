extends CharacterBody2D
class_name Lofi

@onready var check_detection: Area2D = $CheckDetection
@export var tree : AnimationTree
@export var SPEED : float = 67.67
var input
var playback : AnimationNodeStateMachinePlayback

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
	animate()
	
func dev_dialog():
	if Input.is_action_just_pressed('dev01'):
		DialogueManager.show_dialogue_balloon(load("res://dev/dialogue/devdiary08.dialogue"), "start")


func _on_check_detection_area_entered(area: Area2D) -> void:
	if area is Interactable:
		print("Check me out!")
		
func select_animation():
	if velocity == Vector2.ZERO:
		playback.travel("Idle")
	else:
		playback.travel("Walk")
	
func animate():
	#if input == Vector2.ZERO:
		#return
	#tree["parameters/Idle/blend_position"] = input
	#tree["parameters/Walk/blend_position"] = input
	if input:
		var anim_direction = Vector2(round(input.x), round(input.y))
		tree.set("parameters/Idle/blend_position", anim_direction)
		tree.set("parameters/Walk/blend_position", anim_direction)
	
