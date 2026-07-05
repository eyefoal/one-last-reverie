extends StaticBody2D
class_name PushableBlock

@onready var push_detection: RayCast2D = $RayCast2D
@export var pushable := false
@export var max_pushes := -1
var push_count = 0

func _ready() -> void:
	push_detection.enabled = pushable

func push_block(direction):
	push_detection.target_position = direction * 16
	push_detection.force_raycast_update()
	
	if not pushable or push_detection.is_colliding() or push_count == max_pushes: return
	
	_move(global_position + direction * 16)
	
	push_count += 1

func _move(targetPosition):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", targetPosition, 0.42)
