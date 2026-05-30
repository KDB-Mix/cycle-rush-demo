class_name TouchScreen
extends CanvasLayer

@onready var left: TouchScreenButton = $Left
@onready var right: TouchScreenButton = $Right
@onready var control: Control = $Control


var last_screen_size := Vector2.ZERO

func _ready():
	update_buttons()

func _process(_delta):
	var current_size = control.get_viewport_rect().size
	if current_size != last_screen_size:
		last_screen_size = current_size
		update_buttons()

func update_buttons():
	if not left or not right or not control:
		return

	var screen_size = control.get_viewport_rect().size
	var half_width = screen_size.x / 2
	var full_height = screen_size.y

	var tex_size = left.texture_normal.get_size()
	if tex_size.x == 0 or tex_size.y == 0:
		return

	var button_scale = Vector2(
		half_width / tex_size.x,
		full_height / tex_size.y
	)

	left.scale = button_scale
	left.position = Vector2(0, 0)

	right.scale = button_scale
	right.position = Vector2(half_width, 0)
