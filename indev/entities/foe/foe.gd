extends CharacterBody2D
class_name Foe

@export var speed : float = 15.5
@onready var player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	print(player)

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed 
	move_and_slide()
