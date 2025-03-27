extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/main.tscn")
	

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_mouse_entered() -> void:
	$Select.play()


func _on_quit_mouse_entered() -> void:
	$Select.play()
