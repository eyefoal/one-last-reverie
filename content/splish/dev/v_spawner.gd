extends Node

@export var spawnables: Array[PackedScene]
@export var max_spawn_width := 100
@export var min_spawn_width := 240
@onready var marker: Marker2D = $Marker2D

func _ready() -> void:
	print("splish")

func _on_timer_timeout() -> void:
	print("spawning")
	var random_platform: PackedScene = spawnables.pick_random()
	var random_platform_instance: Node = random_platform.instantiate()
	add_child(random_platform_instance)
	
	random_platform_instance.position = marker.position
	
	var random_x_position: float = randf_range(50, 360)
	random_platform_instance.position.x = random_x_position
