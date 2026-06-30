extends Area2D
class_name Door

@export_file("*.tscn") var scene : String
@export var door_name : String
@onready var spawn_point: Marker2D = $Marker2D

var body_to_transport : CharacterBody2D
var can_warp : bool = false

func _process(_delta: float) -> void:
	
	if can_warp and body_to_transport and Input.is_action_just_pressed("a"):
		warp()
	
	
func warp() -> void:
		Main.go_to_door(scene, door_name)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or Lofi and is_in_group("Player"):
		body_to_transport = body
		can_warp = true
		print(body_to_transport)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body_to_transport = null
		print(body_to_transport)
		can_warp = false
