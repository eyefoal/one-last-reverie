extends CharacterBody2D
class_name PinkThing

signal died

func _ready() -> void:
	print("I am " + str(self.name))

func _on_hurt_box_hit() -> void:
	died.emit()
	
