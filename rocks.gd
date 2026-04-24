class_name Rock
extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

const STONE_SCENE: PackedScene = preload("res://scenes/objects/rocks/stone.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damaged_reached.connect(on_max_damage_reached)
	
func on_hurt(hit_damage: int) -> void:
	damage_component.apply_damage(hit_damage)
	material.set_shader_parameter("shake_intensity" , 0.5)
	await get_tree().create_timer(1.0).timeout
	material.set_shader_parameter("shake_intensity" , 0.0)

func on_max_damage_reached() -> void:
	call_deferred("_handle_destruction")

func _handle_destruction() -> void:
	var tile_layer: TileMapLayer = get_parent() as TileMapLayer
	if tile_layer:
		var cell: Vector2i = tile_layer.local_to_map(tile_layer.to_local(global_position))
		tile_layer.erase_cell(cell)
		spawn_stone(tile_layer)
	else:
		spawn_stone(get_parent())
	queue_free()

func spawn_stone(parent_node: Node) -> void:
	if parent_node == null:
		return

	var stone_instance: Node2D = STONE_SCENE.instantiate() as Node2D
	stone_instance.global_position = global_position
	parent_node.add_child(stone_instance)
