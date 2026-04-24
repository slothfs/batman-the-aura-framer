class_name Player
extends CharacterBody2D


@export var current_tool: DataTypes.Tools = DataTypes.Tools.None
var player_direction: Vector2

func _process(_delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	if current_tool == DataTypes.Tools.None:
		return
		
	var target_pos: Vector2 = Vector2.ZERO
	if player_direction == Vector2.UP:
		target_pos = Vector2(5, -51)
	elif player_direction == Vector2.RIGHT:
		target_pos = Vector2(25, -6)
	elif player_direction == Vector2.DOWN:
		target_pos = Vector2(-5, -1)
	elif player_direction == Vector2.LEFT:
		target_pos = Vector2(-22, -6)
	else:
		target_pos = Vector2(-5, -1) # default down/front
		
	# Draw a translucent circle matching the hit collision area
	draw_arc(target_pos, 6.0, 0, TAU, 16, Color(1, 1, 1, 0.5), 1.0)
	
	# Draw a small crosshair (plus sign)
	var length = 3.0
	draw_line(target_pos - Vector2(length, 0), target_pos + Vector2(length, 0), Color(1, 0, 0, 0.7), 1.0)
	draw_line(target_pos - Vector2(0, length), target_pos + Vector2(0, length), Color(1, 0, 0, 0.7), 1.0)
