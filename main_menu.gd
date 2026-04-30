extends Control

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
	



func _on_explore_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
	



func _on_quit_pressed() -> void:
	get_tree().quit()
