class_name MoveComponentSide extends Node

@export_category("Setup")
@export var body : CharacterBody2D

@export_category("Stats")
@export var speed : int
@export var acceleration : int
@export var deceleration : int
@export var fall_speed : int
@export var jump_speed : int
@export var jump_height : int
@export var max_jumps : int 
var jumps : int




func _physics_process(delta: float) -> void:
	tick(delta)

func tick(delta:float) -> void:
	var direction := Input.get_axis("left", "right")
	
	if body == null:
		return		
		
	if direction == 0:
		body.velocity.x = move_toward(body.velocity.x, 0, deceleration)
	else:
		body.velocity.x = move_toward(body.velocity.x, speed * direction, acceleration)
		
	if body.is_on_floor():
		jumps = max_jumps

	if not body.is_on_floor():
		fall(delta)
	
	if Input.is_action_just_pressed("a"):
		jump(delta)
	
	
	body.move_and_slide()
	
func jump(delta:float) -> void:
	body.velocity.y = 0.0
	
	if jumps > 0:
		body.velocity.y = move_toward(body.velocity.y, -jump_height, jump_speed)
		jumps -= 1
	elif body.velocity.y < 0 or Input.is_action_just_released("a"):
		fall(delta)

func fall(delta):
	body.velocity.y += fall_speed * delta
