extends Node2D
class_name SplishManager

@onready var label: Label = $CanvasLayer/Panel/HBoxContainer/ScoreLabel
@onready var hi_score_label: RichTextLabel = $CanvasLayer/Panel/HBoxContainer/HiScoreLabel

var score : int
var hi_score : int = 128 #Maxine's high score

func _ready() -> void:
	Eventbus.splish_point.connect(update_point)
	hi_score_label.text = "[rainbow] High Score: " + str(hi_score)

func update_point(value : int):
	score += value
	label.text = "Score: " + str(score)
	if score >= hi_score:
		hi_score_label.text = "[rainbow] High Score: " + str(score)
