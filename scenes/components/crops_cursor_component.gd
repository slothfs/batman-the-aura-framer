class_name CropsCursorComponent
extends Node

@export var tilled_soil_tilemap_layer: TileMapLayer

var player: Player

var corn_plant_scene = preload("res://scenes/objects/plants/corn.tscn")
# var tomato_plant_scene = preload("res://scenes/objects/plants/tomato.tscn")

var mouse_position: Vector2
var cell_position: Vector2i
var cell_source_id: int
var local_cell_position : Vector2 
var distance: float 

func _ready() -> void:
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")
	if not tilled_soil_tilemap_layer:
		tilled_soil_tilemap_layer = get_parent().get_node("TilledSoil")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_dirt"):
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_under_mouse()
			remove_crop()
	elif event.is_action_pressed("hit"):
		if ToolManager.selected_tool == DataTypes.Tools.PlantCorn or ToolManager.selected_tool == DataTypes.Tools.PlantTomato:
			get_cell_under_mouse()
			add_crop()


func get_cell_under_mouse() -> void:
	mouse_position = tilled_soil_tilemap_layer.get_local_mouse_position()
	cell_position = tilled_soil_tilemap_layer.local_to_map(mouse_position)
	cell_source_id = tilled_soil_tilemap_layer.get_cell_source_id(cell_position)
	local_cell_position = tilled_soil_tilemap_layer.map_to_local(cell_position)
	distance = player.global_position.distance_to(tilled_soil_tilemap_layer.to_global(local_cell_position))

func add_crop() -> void:
	if distance < player.hit_range and cell_source_id != -1:
		var crop_fields = get_parent().find_child("CropFields")
		if not crop_fields:
			crop_fields = Node2D.new()
			crop_fields.name = "CropFields"
			get_parent().add_child(crop_fields)
			
		if ToolManager.selected_tool == DataTypes.Tools.PlantCorn:
			var corn_instance = corn_plant_scene.instantiate() as Node2D
			corn_instance.global_position = tilled_soil_tilemap_layer.to_global(local_cell_position)
			crop_fields.add_child(corn_instance)
	
		if ToolManager.selected_tool == DataTypes.Tools.PlantTomato:
			pass

func remove_crop() -> void:
	if distance < player.hit_range:
		var crop_fields = get_parent().find_child("CropFields")
		if crop_fields:
			var crop_nodes = crop_fields.get_children()
			
			for node: Node2D in crop_nodes:
				if node.global_position == tilled_soil_tilemap_layer.to_global(local_cell_position):
					node.queue_free()
