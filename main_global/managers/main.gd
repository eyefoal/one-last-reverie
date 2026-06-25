extends Node

var global_state : String = "Act -1"
var gb_cat_state : String = "unknown"
var current_level : String = ""
var player_pos : Vector2


func _ready() -> void:
	global_state = "Act 0"
	dev_print()
	
func dev_print():
	print("hai :3")
	#print(current_level)
	#print(global_state)
	#print(gb_cat_state)

func _save() -> void:
	
	SaveLoad.contents_to_save.current_level = current_level
	SaveLoad._save()
	print("undersave")
	

func _load() -> void:
	print("underload")
	

func switch_level(to_level : String):
	#to_level = Main.current_level
	get_tree().change_scene_to_file(to_level)
	print(to_level)
	print("changing")
