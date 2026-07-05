class_name Health extends Node

@export var body : CharacterBody2D
@export var max_health : int = 100
var current_health = 0.0

signal health_changed(current: float, max: float)
signal died

func _ready() -> void:
	current_health = max_health
	_emit()
	print("Health Component Ready!")

func damage(amount: float) -> void:
	current_health = clamp(current_health - amount, 0.0, max_health) #current health, thanks to clamp, cant go below 0.0 or above maximum health
	_emit()
	if current_health == 0.0:
		died.emit()

func heal(amount: float) -> void:
	current_health = clamp(current_health + amount, 0.0, max_health)
	_emit()

func _emit() -> void:
	health_changed.emit(current_health, max_health)
	print("HP: %d / %d " % [current_health, max_health])
	
func hit(attack: Attack):
	current_health -= attack.power
