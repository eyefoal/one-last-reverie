extends CanvasModulate

signal time_tick(day:int, hour:int, minute:int)

const minutes_per_day := 1440
const minutes_per_hour := 60
const real_minute_duration = (TAU) / minutes_per_day
@export var gradient : GradientTexture1D
@export var ingame_speed := 1.0
@export var initial_hour = 6:
	set(h):
		initial_hour = h
		time = real_minute_duration * initial_hour * minutes_per_hour

var time : float = 0.0
var past_minute : float = -1.0

func _ready() -> void:
	print(real_minute_duration)
	time = real_minute_duration * initial_hour * minutes_per_hour

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta * real_minute_duration * ingame_speed
	var value = (sin(time - PI / 2) + 1.0) / 2.0
	self.color = gradient.gradient.sample(value)
	
	_recalc_time()

func _recalc_time() -> void:
	var total_min = int(time / real_minute_duration)
	
	@warning_ignore("integer_division")
	var day = int(total_min / minutes_per_day)
	var current_day_minutes = total_min % minutes_per_day
	
	@warning_ignore("integer_division")
	var hour = int(current_day_minutes / minutes_per_hour)
	var minute = int( current_day_minutes % minutes_per_hour)
	
	if past_minute != minute:
		past_minute = minute
		time_tick.emit(day, hour, minute)
	pass
