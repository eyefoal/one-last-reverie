extends Node

var global_state : String = "Act -1"
var gb_cat_state : String = "unknown"
var current_level : String = ""
var player_pos : Vector2
var path : String = "user://user_data.tres"
var data = ResourceLoader.load(path) as LevelData

func _ready() -> void:
	global_state = "Act 0"
	if data:
		current_level = data.current_level
		print(current_level)
		print(data)
		_save()
		_load()
		dev_print()
	
func dev_print():
	print(current_level)
	print(global_state)
	print(gb_cat_state)

func _save() -> void:
	data = LevelData.new()
	data.current_level = current_level
	print("saved!")

func _load() -> void:
	print(data)
	current_level = data.current_level
	
	print("load")
	

func switch_level(to_level : String):
	#to_level = Main.current_level
	get_tree().change_scene_to_file(to_level)
	print(to_level)
	print("changing")
