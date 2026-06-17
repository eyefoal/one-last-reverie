class_name MoveComponentSide extends Node

@export_category("Setup")
@export var body : CharacterBody2D
var direction := Input.get_axis("left", "right")

func tick(delta:float) -> void:
	if body == null:
		return		
		
	if direction == 0:
		body.velocity.x = move_toward(body.velocity.x, 0, body.stats.deceleration)
	else:
		body.velocity.x = move_toward(body.velocity.x, body.stats.speed * direction, body.stats.acceleration)
		
	if body.is_on_floor():
		body.stats.jumps = body.stats.max_jumps

	if not body.is_on_floor():
		fall(delta)
	
	
	body.move_and_slide()
	
func jump(delta:float) -> void:
	if body.stats.jumps > 0:
		body.velocity.y = move_toward(body.velocity.y, body.stats.jump_height, body.stats.jump_speed)
		body.stats.jumps -= 1
	else:
		fall(delta)

func fall(delta):
	body.velocity.y += body.stats.fall_speed * delta
