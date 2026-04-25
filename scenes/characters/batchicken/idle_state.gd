class_name ChickenIdleState
extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D

const MIN_IDLE_DURATION: float = 3.0
const MAX_IDLE_DURATION: float = 5.0

var idle_timer: float = 0.0
var wait_duration: float = MIN_IDLE_DURATION

func enter() -> void:
	wait_duration = randf_range(MIN_IDLE_DURATION, MAX_IDLE_DURATION)
	idle_timer = 0.0
	character.velocity = Vector2.ZERO
	animated_sprite_2d.play("idle")
	print("IdleState: enter, waiting %.2f seconds before walking" % wait_duration)

func physics_process(delta: float) -> void:
	idle_timer += delta
	character.velocity = Vector2.ZERO
	character.move_and_slide()

func next_transitions() -> void:
	if idle_timer >= wait_duration:
		print("IdleState: transition to Walk after %.2f seconds" % idle_timer)
		transition.emit("Walk")

func exit() -> void:
	animated_sprite_2d.stop()
