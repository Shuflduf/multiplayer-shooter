extends Control


func _on_server_pressed() -> void:
    get_tree().change_scene_to_file("res://server.tscn")


func _on_client_pressed() -> void:
    get_tree().change_scene_to_file("res://client.tscn")
