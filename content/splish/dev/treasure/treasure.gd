extends CharacterBody2D
class_name Treasure

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var SPEED = 128.5
@export var move_dir : Vector2 
@export var point_value : int = 10

func _physics_process(_delta: float) -> void:
	velocity = move_dir * SPEED
	sprite_2d.rotate(0.06)
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	print("off screen!")


func _on_collect_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		queue_free()
		Eventbus.splish_point.emit(point_value)
		print("collected")
		
