class_name Rock
extends Area3D



func _on_area_entered(area: Area3D) -> void:
	if area.get_parent() is Player:
		var player: Player = area.get_parent()
		player.animated_sprite_3d.modulate = Color(.5, 0, 0)
		await get_tree().create_timer(.5).timeout
		player.animated_sprite_3d.modulate = 1
		get_tree().reload_current_scene()
	


func _on_visible_on_screen_enabler_3d_screen_exited() -> void:
	call_deferred("queue_free")
