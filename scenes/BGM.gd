extends AudioStreamPlayer

func _ready() -> void:
	# Duplicate the AudioStream resource so we can set its loop flag
	var s = stream.duplicate() as AudioStream
	if s is AudioStreamOggVorbis or s is AudioStreamMP3:
		s.loop = true
	
		
	# Assign back and play
	stream = s
	play()
