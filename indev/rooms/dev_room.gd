extends Node2D
class_name DevRoom

@export var player : Node2D

func _ready() -> void:
	_save()
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quicksave"):
		_save()
		
	if Input.is_action_just_pressed("quickload"):
		_load()

func _save() -> void:
	
	SaveLoad.contents_to_save.player_pos = player.global_position
	SaveLoad.contents_to_save.current_level = str(self.scene_file_path)
	print("current_level: " + SaveLoad.contents_to_save.current_level)
	print(SaveLoad.contents_to_save.player_pos)
	SaveLoad._save()

func _load() -> void:
	print("superload")
	player.global_position = SaveLoad.contents_to_save.player_pos
	
	pass
