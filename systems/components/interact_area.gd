extends Area2D
class_name Interactable

@export var dialogue_resource : DialogueResource
@export var dialogue_start: String = "start"

func interact() -> void:
	
	#var my_balloon :  = Balloon.instantiate() as MyBalloon
	#get_tree().current_scene.add_child(my_balloon)
	#my_balloon.start(dialogue_resource, dialogue_start)
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
	#DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
