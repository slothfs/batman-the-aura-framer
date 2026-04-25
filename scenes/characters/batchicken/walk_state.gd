class_name ChickenWalkState
extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var navigation_agent_2d: NavigationAgent2D
@export var min_speed: float = 80.0
@export var max_speed: float = 140.0

var speed: float = 0.0
var current_target: Vector2 = Vector2.ZERO
var has_target: bool = false

func enter() -> void:
	animated_sprite_2d.play("walk")
	speed = randf_range(min_speed, max_speed)
	has_target = false
	print("WalkState: enter at speed %.2f" % speed)
	call_deferred("_request_navigation_target")

func physics_process(delta: float) -> void:
	if has_target and not navigation_agent_2d.is_navigation_finished():
		var next_position: Vector2 = navigation_agent_2d.get_next_path_position()
		if character.global_position != next_position:
			var direction: Vector2 = character.global_position.direction_to(next_position)
			animated_sprite_2d.flip_h = direction.x < 0.0
			character.velocity = direction * speed
		else:
			character.velocity = Vector2.ZERO
	else:
		character.velocity = Vector2.ZERO
	character.move_and_slide()

func next_transitions() -> void:
	if has_target and navigation_agent_2d.is_navigation_finished():
		print("WalkState: navigation finished at target ", current_target)
		transition.emit("Idle")

func exit() -> void:
	animated_sprite_2d.stop()

func _request_navigation_target() -> void:
	var map_rid: RID = navigation_agent_2d.get_navigation_map()
	if not map_rid.is_valid():
		print("WalkState: navigation map RID is invalid; ensure NavigationRegion2D is baked and reachable.")
		return
	while NavigationServer2D.map_get_iteration_id(map_rid) == 0:
		print("WalkState: waiting for navigation map to synchronize")
		await get_tree().physics_frame
	var random_point: Vector2 = NavigationServer2D.map_get_random_point(
		map_rid,
		navigation_agent_2d.navigation_layers,
		false
	)
	current_target = random_point
	navigation_agent_2d.target_position = random_point
	has_target = true
	print("WalkState: new target ", current_target)
