extends CharacterBody2D
class_name Shark

@export var SPEED = 500.5
var move_dir : float = -1.0

func _physics_process(_delta: float) -> void:
	velocity.x = move_dir * SPEED
	
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	Eventbus.splish_point.emit()
	print("+ 1 point")
