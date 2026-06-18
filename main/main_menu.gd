extends CanvasLayer


func _on_prologue_pressed() -> void:
	get_tree().change_scene_to_file("res://indev/rooms/dev_room_01.tscn")

func _on_quick_shplish_pressed() -> void:
	# Queue fade transition
	get_tree().change_scene_to_file("res://content/splish/dev/splish.tscn")
	
func _on_quit_pressed() ->  void:
	get_tree().quit()
