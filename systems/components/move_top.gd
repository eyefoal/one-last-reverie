class_name MoveComponentTop extends Node

@export var body: CharacterBody2D
@export var speed := 420.0
@export var acceleration := 420.0
@export var quirky : bool
var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
		if quirky:
			print("im quirky")
		print("Movement Component Ready!")

func _physics_process(_delta: float) -> void:
	tick(_delta)

func tick(_delta:float) -> void:
	
	if quirky: 
		direction = Input.get_vector("left", "right", "up", "down")
	else: 
		direction = Input.get_vector("left", "right", "up", "down").normalized()
		
	if body == null:
		return
	
	# Top Down Movement
	body.velocity.x = lerp(body.velocity.x, direction.x * speed, acceleration * _delta)
	body.velocity.y = lerp(body.velocity.y, direction.y * speed, acceleration * _delta)
	
	body.move_and_slide() 
