extends Node2D
class_name DevRoom

@export var player : Node2D
var path : String = "user://user_data.tres"

func _ready() -> void:
	_save()
	_load()
	var data = ResourceLoader.load(path) as LevelData
	if data:
		player.global_position = data.player_pos
	else:
		pass

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("dev03"):
		_save()
		
	if Input.is_action_just_pressed("dev04"):
		_load()

func _save() -> void:
	var data = LevelData.new()
	data.player_pos = player.global_position
	data.quirkiness = randi_range(0, 100)
	
	ResourceSaver.save(data, path)
	print("saved!")

func _load() -> void:
	
	var data = ResourceLoader.load(path) as LevelData
	if data:
		player.global_position = data.player_pos
	
	
	print("loaded!")
	print(data.quirkiness)
