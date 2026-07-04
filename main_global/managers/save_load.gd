extends Node

const save_location = "user://SaveFile.json"

var contents_to_save : Dictionary = {
	"quirkiness" : randi_range(0, 100),
	"current_level" : "",
	"player_pos" : Vector2(0.0, 0.0),
	"current_act" : "Act 0",
	"current_player" : "",
	"splish_hi" : 0,
}


func _save():
	var file = FileAccess.open(save_location, FileAccess.WRITE)
	file.store_var(contents_to_save.duplicate())
	file.close()
	print("hypersave")
	pass

func _load():
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open(save_location, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var save_data = data.duplicate()
		contents_to_save.player_pos = save_data.player_pos
		contents_to_save.current_level = save_data.current_level
		get_tree().call_deferred("change_scene_to_file", save_data.current_level)
		print("superload")
	pass
