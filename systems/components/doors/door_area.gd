extends Area2D
class_name DoorArea

@export_file("*.tscn") var scene : String
@export var door_name : String


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print(body)
		Main.go_to_door(scene, door_name)
