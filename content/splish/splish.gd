extends Node2D
class_name SplishManager

@onready var label: Label = $CanvasLayer/Panel/HBoxContainer/ScoreLabel
@onready var hi_score_label: RichTextLabel = $CanvasLayer/Panel/HBoxContainer/HiScoreLabel

var score : int
var hi_score : int #Maxine's high score

func _ready() -> void:
	load_score()
	Eventbus.splish_point.connect(update_point)
	hi_score_label.text = "[rainbow] High Score: " + str(hi_score)
	

func update_point(value : int):
	score += value
	label.text = "Score: " + str(score)
	if score >= hi_score:
		hi_score_label.text = "[rainbow] High Score: " + str(score)


func _on_pink_thing_died() -> void:
	save_score()
	
	get_tree().paused = true
	await get_tree().create_timer(0.3).timeout
	get_tree().call_deferred("reload_current_scene")
	get_tree().paused = false
	
	
	
	
func save_score() -> void:
	if score >= hi_score:
		SaveLoad.contents_to_save.splish_hi = score
	SaveLoad._save()
	print("saved?!")
	print(SaveLoad.contents_to_save.splish_hi)

func load_score() -> void:
	hi_score = SaveLoad.contents_to_save.splish_hi
	print("loaded score")
	print(SaveLoad.contents_to_save.splish_hi)
