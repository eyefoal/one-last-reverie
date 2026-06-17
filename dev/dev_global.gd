extends Node

@export var rooms : Array = [
	"res://dev/devroom/dev_room_01.tscn",
	"res://dev/devroom/dev_room_02.tscn"
]

func _ready() -> void:
	print(rooms)

func change_room():
	get_tree().change_scene_to_file(rooms[1])
