extends Area2D

@onready var timer: Timer = $Timer
@export var weapon : PackedScene
var fire_direction
var target

func _physics_process(_delta: float) -> void:
	var foes_in_range = get_overlapping_bodies() # Returns an array of every enemy in range.
	if foes_in_range.size() > 0:
		target = foes_in_range[0] # Returns first enemy in "foes_in_range" array
		look_at(target.global_position)
		

func shoot():
	var new_weapon = weapon.instantiate() as AutoBullet
	new_weapon.direction = Vector2.ZERO
	new_weapon.global_position = global_position
	new_weapon.global_rotation = global_rotation
	self.add_child(new_weapon)
	print(target)


func _on_timer_timeout() -> void:
	print("emit")
	shoot()
