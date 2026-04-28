extends MarginContainer

func _ready():
	print("MarginContainer READY")
	print("Size:", size, "Global Pos:", global_position)
	queue_redraw()
