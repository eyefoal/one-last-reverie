extends Node
class_name Spawner

@export var spawnables: Array[PackedScene]
@export var max_spawn_height := 360
@export var min_spawn_height := 50
@onready var marker: Marker2D = $Marker2D

func _ready() -> void:
	print("splish")

func _on_timer_timeout() -> void:
	print("spawning")
	var random_platform: PackedScene = spawnables.pick_random()
	var random_platform_instance: Node = random_platform.instantiate()
	add_child(random_platform_instance)
	
	random_platform_instance.position = marker.position
	
	var random_y_position: float = randf_range(min_spawn_height, max_spawn_height)
	random_platform_instance.position.y = random_y_position
