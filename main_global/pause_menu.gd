extends CanvasLayer



func _ready() -> void:
	visible = false
	get_tree().paused = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("start"):
		visible = true
		get_tree().paused = true

		
	#if Input.is_action_just_pressed("start"):
		#resume()
	
	
	
func _on_resume_button_pressed() -> void:
	resume()

func resume():
	visible = false
	get_tree().paused = false


func _on_save_quit_button_pressed() -> void:
	Main._save()
	get_tree().change_scene_to_file("res://main_global/main_menu.tscn")
	resume()
