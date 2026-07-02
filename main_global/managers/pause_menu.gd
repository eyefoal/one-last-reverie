extends CanvasLayer

@export var pause: Control
@export var options: Panel


func _ready() -> void:
	visible = false
	options.visible = false
	get_tree().paused = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("start"):
		visible = true
		get_tree().paused = true
	
	
	
	
func _on_resume_button_pressed() -> void:
	_ready()

func _on_options_button_pressed() -> void:
	options.visible = true
	pause.visible = false

func _on_back_pressed() -> void:
	options.visible = !options.visible
	pause.visible = !pause.visible
	
func _on_save_quit_button_pressed() -> void:
	SaveLoad._save()
	get_tree().change_scene_to_file("res://main_global/main_menu.tscn")
	_ready()
