extends StaticBody2D
class_name BreakableBlock

func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		print("crunch")
		queue_free()
