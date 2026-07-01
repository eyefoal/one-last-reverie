extends HSlider

@export var test_sound : AudioStream
@export var audio_bus_name : String
@export var test_player: AudioStreamPlayer

var audio_bus_id

func _ready() -> void:
	test_player.stream = test_sound
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)


func _on_value_changed(_value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)
	test_player.play()
