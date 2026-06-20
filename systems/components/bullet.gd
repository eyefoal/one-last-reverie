extends Area2D
class_name Bullet

@export var timer : Timer 

@export_category("Bullet Stats")
@export var knockback_force : float = 42.0
@export var power : float = 1.0
@export var speed : float = 420.0
@export var lifetime : float

var direction : Vector2




func setup(pos: Vector2, dir: Vector2):
	position = pos + 16 * dir
	direction = dir

func _physics_process(delta: float) -> void:
	
	global_position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		queue_free()
	
	if body is BreakableBlock:
		body.queue_free()
		queue_free()
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	print("dead")


func _on_timer_timeout() -> void:
	queue_free()
	print("timeout")
