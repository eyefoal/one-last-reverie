extends Area2D
class_name CatDoor

@export var to_level : PackedScene
var body_to_transport : CharacterBody2D
var can_warp : bool = false

func _process(_delta: float) -> void:
	if can_warp and body_to_transport and Input.is_action_just_pressed("a"):
		warp()
	
	
func warp() -> void:
	await FadeTransition.fade(1.0, 1.0).finished
	get_tree().call_deferred("change_scene_to_packed", to_level)
	#Main.call_deferred("switch_level", to_level)
	await FadeTransition.fade(0.0, 1.0).finished
		
		
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or Lofi and is_in_group("Player"):
		body_to_transport = body
		can_warp = true
		print(body_to_transport)


@warning_ignore("unused_parameter")
func _on_body_exited(body: Node2D) -> void:
	can_warp = false
