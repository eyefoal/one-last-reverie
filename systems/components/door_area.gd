extends Area2D
class_name DoorArea

@export var level_path : PackedScene


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print(body)
		change_scene(level_path)

func change_scene(to_level : PackedScene):
	print(to_level)
	to_level = level_path
	get_tree().change_scene_to_packed(level_path)
