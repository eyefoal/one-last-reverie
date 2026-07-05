extends Node
class_name VSpawner #Vertical spawner will spawn powerups, treasure and items.

@export var spawnables: Array[PackedScene]
@export var max_spawn_width := 240
@export var min_spawn_width := 100
@onready var marker: Marker2D = $Marker2D

func _ready() -> void:
	print("verticool")

func _on_timer_timeout() -> void:
	print("treasure!")
	var random_platform: PackedScene = spawnables.pick_random()
	var random_platform_instance: Node = random_platform.instantiate()
	add_child(random_platform_instance)
	
	random_platform_instance.position = marker.position
	
	var random_x_position: float = randf_range(min_spawn_width, max_spawn_width)
	random_platform_instance.position.x = random_x_position
