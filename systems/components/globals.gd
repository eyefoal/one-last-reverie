extends Camera2D
class_name ZeldaCam 


const SCREEN_SIZE : Vector2 = Vector2( 640, 360 )
var cur_screen := Vector2( 0, 0 )

@export var max_shake : float = 1.0
@export var shake_fade : float = 10.42

func _ready():
	self.add_to_group("Camera")
	set_as_top_level( true )
	global_position = get_parent().global_position
	_update_screen( cur_screen )
var _shake_strength : float = 0.0

func shake() -> void:
	_shake_strength = max_shake
	

func _process(delta: float) -> void:
	if _shake_strength > 0:
		_shake_strength = lerp(_shake_strength, 0.0, shake_fade * delta)
		offset = Vector2(randf_range(-_shake_strength, _shake_strength), (randf_range(-_shake_strength, _shake_strength)))

func _physics_process(_delta):
	var parent_screen : Vector2 = ( get_parent().global_position / SCREEN_SIZE ).floor()
	if not parent_screen.is_equal_approx( cur_screen ):
		_update_screen( parent_screen )


func _update_screen( new_screen : Vector2 ):
	cur_screen = new_screen
	global_position = cur_screen * SCREEN_SIZE + SCREEN_SIZE * 0.5
	print(cur_screen)
