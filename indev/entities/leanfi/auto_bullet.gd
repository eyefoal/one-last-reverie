extends CharacterBody2D
class_name AutoBullet

@export var speed := 100.5
var direction := Vector2.RIGHT.rotated(rotation)


func _physics_process(delta: float) -> void:

	global_position += direction * speed * delta
	await get_tree().create_timer(2).timeout #life timer
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	print("oof")


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is HurtBox:
		print("pew")
		area.hit.emit()
		queue_free()
