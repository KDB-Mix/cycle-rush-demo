extends Camera3D
@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right") and global_position.x < 1.15:
		position.x += delta
		animated_sprite_3d.play("right")
	elif Input.is_action_pressed("ui_left") and global_position.x > -1.15:
		position.x -= delta
		animated_sprite_3d.play("left")
	else:
		animated_sprite_3d.play("strait")
	position.x = clamp(position.x, -1.15, 1.15)
