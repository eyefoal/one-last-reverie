class_name BasicInput extends Node

var move_dir: Vector2 = Vector2.ZERO
var side_dir := Input.get_axis("left", "right")
var aim_dir : Vector2 = Vector2.ZERO

var jump_pressed := false
var jump_released := false

var a_pressed := false
var b_pressed := false


func _ready() -> void:
	print("Input Component Ready!")

func update() -> void: 
	move_dir = Input.get_vector("left", "right", "up", "down")
	side_dir = Input.get_axis("left", "right")
	aim_dir = Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down")
	
	jump_pressed = Input.is_action_pressed("jump")
	jump_released = Input.is_action_just_released("jump")
	
	a_pressed = Input.is_action_just_pressed("a")
	b_pressed = Input.is_action_just_released("b")
