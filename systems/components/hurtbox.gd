extends Area2D
class_name HurtBox

@export var health : Health

func damage(attack: Attack):
	if health:
		health.damage(attack)
	
	if health == null:
		pass
