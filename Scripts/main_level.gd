extends Node3D
@onready var csg_polygon_3d: CSGPolygon3D = $CSGPolygon3D

func _process(delta: float) -> void:
	csg_polygon_3d.position.z -= delta*2
