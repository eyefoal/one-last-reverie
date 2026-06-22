extends CharacterBody2D
class_name PinkThing

func _ready() -> void:
	print("I am " + str(self.name))


func _on_hurt_box_hit() -> void:
	get_tree().paused = true
	await get_tree().create_timer(0.3).timeout
	get_tree().call_deferred("reload_current_scene")
	get_tree().paused = false
