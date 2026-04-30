class_name MouseCursorComponent
extends Node

@export var cursor_component_texture: Texture2D

func _ready() -> void:
	if cursor_component_texture:
		var img: Image = cursor_component_texture.get_data()
		img.resize(32, 32)
		var resized_tex := ImageTexture.create_from_image(img, 0)
		var hotspot := Vector2(resized_tex.get_width(), resized_tex.get_height()) * 0.5
		Input.set_custom_mouse_cursor(resized_tex, Input.CURSOR_ARROW, hotspot)
