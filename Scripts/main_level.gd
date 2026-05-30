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
	var rockpos: Vector3 = Vector3.ZERO
	for i in range(2):
		var rockNode :Rock = rockScene.instantiate()
		rocks.add_child(rockNode)
		rockNode.global_position = Vector3(randf()*1.8-.9, .555, player.global_position.z-3)
		if rockpos != Vector3.ZERO:
			fixOverlap(rockNode, rockpos, .42)
		rockpos = rockNode.global_position
	spawnRock(rockScene)

func fixOverlap(rockNode, rockpos, range):
	if rockNode.global_position.x > rockpos.x-range and rockNode.global_position.x < rockpos.x+range:
		rockNode.global_position = Vector3(randf()*1.8-.9, .555, player.global_position.z-3)
		fixOverlap(rockNode ,rockpos, range)
	
