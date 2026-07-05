extends CanvasLayer
class_name TestFade

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.color.a = 0.0

func fade(target_a: float, duration: float = 0.24):
	var tween = create_tween()
	tween.tween_property(color_rect, "color:a", target_a, duration)
	return tween
