extends Node2D
class_name SplishManager

@onready var label: Label = $CanvasLayer/Panel/HBoxContainer/ScoreLabel
@onready var hi_score_label: RichTextLabel = $CanvasLayer/Panel/HBoxContainer/HiScoreLabel


var score : int
var hi_score : int 

func _ready() -> void:
	load_score()
	Eventbus.splish_point.connect(update_point)
	Eventbus.under_save.connect(save_score)
	hi_score_label.text ="[rainbow] High Score: " + str(Main.splish_high_score)
	

func update_point(value : int):
	score += value
	label.text = "Score: " + str(score)
	if score >= hi_score:
		hi_score = score
		hi_score_label.text = "[rainbow] High Score: " + str(hi_score)
		SaveLoad.contents_to_save.splish_hi = score
		Main.splish_high_score = score
		save_score()


func _on_pink_thing_died() -> void:
	if score >= hi_score:
		save_score()
	
	get_tree().paused = true
	await get_tree().create_timer(0.3).timeout
	get_tree().call_deferred("reload_current_scene")
	get_tree().paused = false
	
	
func save_score() -> void:
	SaveLoad.contents_to_save.splish_hi = score
	SaveLoad._save()
	print("saved?!")
	print(SaveLoad.contents_to_save.splish_hi)

func load_score() -> void:
	hi_score = Main.splish_high_score
	print("loaded score")
	
