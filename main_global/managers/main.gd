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
	get_tree().call_deferred("change_scene_to_file", to_level)
	print(to_level)
	print("changing")

func go_to_door(scene_path : String, DoorName : String):
	await FadeTransition.fade(1.0, 1.0).finished
	get_tree().change_scene_to_file(scene_path)
	await get_tree().create_timer(0.1).timeout
	var doors : Array[Node] = get_tree().get_nodes_in_group("Door")
	var current_player : Node2D = get_tree().get_first_node_in_group("Player")
	print(doors)
	
	for d in len(doors):
		if doors[d].name == DoorName:
			current_player.global_position = doors[d].global_position
			current_player.global_position.y += 24 # Move the player down so they won't immediately collide with the door and create a loop of entering.

	await get_tree().create_timer(0.1).timeout
	FadeTransition.fade(0.0, 1.0)
	
	pass
