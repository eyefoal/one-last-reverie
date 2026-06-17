class_name MoveComponentTop extends Node

@export var body: CharacterBody2D
@export var sprite: Node2D
@export var speed := 420.0
var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
		print("Movement Component Ready!")


func tick(_delta:float) -> void:
	if body == null:
		return
	
	# Top Down Movement
	body.velocity.x = lerp(body.velocity.x, direction.x * speed, _delta)
	body.velocity.y = lerp(body.velocity.y, direction.y * speed, _delta)
	
	body.move_and_slide() 
