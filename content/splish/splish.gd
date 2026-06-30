extends Node2D
class_name SplishManager

@onready var label: Label = $CanvasLayer/Panel/HBoxContainer/ScoreLabel

var score : int
var hi_score : int = 420 #Maxine's high score

func _ready() -> void:
	Eventbus.splish_point.connect(update_point)

func update_point(value : int):
	score += value
	label.text = "Score: " + str(score)
