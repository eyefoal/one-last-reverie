extends Node

var global_state : String = "Act -1"
var gb_cat_state : String = "unknown"

func _ready() -> void:
	dev_print()
	
func dev_print():
	print(global_state)
	print(gb_cat_state)
