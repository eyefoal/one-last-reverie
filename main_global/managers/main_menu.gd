extends CanvasLayer

@export var main_buttons: Panel
@export var options: Panel

func _ready() -> void:
	main_buttons.visible = true
	options.visible = false
	

# Main buttons

func _on_prologue_pressed() -> void:
	get_tree().change_scene_to_file("res://indev/rooms/dev_room_01.tscn")
	
func _on_continue_pressed() -> void:
	#if Main.current_level:
		#Main.switch_level(Main.current_level)
	SaveLoad._load()

#settings
func _on_options_pressed() -> void:
	main_buttons.visible = false
	options.visible = true

func _on_quick_shplish_pressed() -> void:
	# Queue fade transition
	get_tree().change_scene_to_file("res://content/splish/dev/splish.tscn")
	
func _on_quit_pressed() ->  void:
	get_tree().quit()

# Options
func _on_back_pressed() -> void:
	_ready()
