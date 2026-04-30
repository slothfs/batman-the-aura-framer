extends NodeState 

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var hit_component_collision_shape: CollisionShape2D

func _ready() -> void:
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0,0);

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("chopping_back")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("chopping_right")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("chopping_front")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("chopping_left")
	else:
		animated_sprite_2d.play("chopping_front")
		
	hit_component_collision_shape.disabled = false
	# Position collision shape at crosshair relative to player, clamped to hit_range
	var target_global := player.get_global_mouse_position()
	var local_pos := player.to_local(target_global)
	if local_pos.length() > player.hit_range:
		local_pos = local_pos.normalized() * player.hit_range
	hit_component_collision_shape.position = local_pos

func _on_exit() -> void:
	animated_sprite_2d.stop()
	hit_component_collision_shape.disabled = true
