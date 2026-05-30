extends Node3D
@onready var csg_polygon_3d: CSGPolygon3D = $CSGPolygon3D
var rock: PackedScene = preload("res://Scenes/rock.tscn")
@onready var player: Camera3D = %Player
@onready var rocks: Node = %Rocks

func _ready() -> void:
	spawnRock(rock)

func _process(delta: float) -> void:
	csg_polygon_3d.position.z -= delta*2
	
func spawnRock(rockScene):
	var time = 1
	var timer = get_tree().create_timer(time)
	await timer.timeout
	var rockNode :Node3D = rockScene.instantiate()
	rocks.add_child(rockNode)
	rockNode.global_position = Vector3(randf()*2-1, .555, player.global_position.z-2)
	spawnRock(rockScene)
	
