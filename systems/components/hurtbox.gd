extends Area2D
class_name HurtBox

signal hit 

@export var health : Health

func damage(attack: Attack):
	if health:
		health.hit(attack)
	else:
		print("I am invincible!")
	

func _on_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		hit.emit()
		print("area entered")
		
