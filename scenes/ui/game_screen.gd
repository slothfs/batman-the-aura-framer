extends CanvasLayer
class_name GameScreen

@onready var root_margin: MarginContainer = $MarginContainer

func _ready() -> void:
	print("GameScreen loaded")
	_apply_full_screen_layout()

func _apply_full_screen_layout() -> void:
	var viewport_size = get_viewport().get_visible_rect().size
	var canvas_scale = self.scale
	
	root_margin.anchor_left = 0.0
	root_margin.anchor_top = 0.0
	root_margin.anchor_right = 0.0
	root_margin.anchor_bottom = 0.0
	
	root_margin.position = Vector2.ZERO
	if canvas_scale.x > 0 and canvas_scale.y > 0:
		root_margin.size = viewport_size / canvas_scale
	else:
		root_margin.size = viewport_size

	root_margin.size_flags_horizontal = Control.SIZE_FILL
	root_margin.size_flags_vertical = Control.SIZE_FILL
