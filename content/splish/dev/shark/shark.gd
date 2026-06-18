extends CharacterBody2D


const SPEED = 500.5
const JUMP_VELOCITY = -400.0

var move_dir : float = -1.0

func _physics_process(_delta: float) -> void:
	velocity.x = move_dir * SPEED



	move_and_slide()
