extends Area2D
class_name Hitbox

func _on_area_entered(area: Area2D) -> void:
	if area is HurtBox:
		area.hit.emit()
