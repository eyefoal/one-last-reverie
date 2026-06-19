extends Node2D
class_name DevRoom

@export var player : Node2D
var path : String = "user://user_data.tres"


func _ready() -> void:
	var data = LevelData.new()
	data.player_pos = player.global_position
	data.quirkiness = randi_range(0, 100)
	data.current_level = str(self.scene_file_path)
	_save()
	
	print(self.scene_file_path)
	_load()
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quicksave"):
		_save()
		
	if Input.is_action_just_pressed("quickload"):
		_load()

func _save() -> void:
	var data = LevelData.new()
	data.player_pos = player.global_position
	data.quirkiness = randi_range(0, 100)
	data.current_level = str(self.scene_file_path)
	print(data.current_level)
	ResourceSaver.save(data, path)
	Main.current_level = data.current_level
	print(Main.current_level)
	print("saved!")

func _load() -> void:
	var data = ResourceLoader.load(path) as LevelData
	if data:
		player.global_position = data.player_pos
	
	print("loaded!")
	print(data.quirkiness)
