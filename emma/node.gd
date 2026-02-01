
extends Node
@export var world_a: TileMap
@export var world_b: TileMap

var active := 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch_layer"):
		active = 1 - active

		world_a.visible = active == 0
		world_b.visible = active == 1

		world_a.collision_enabled = active == 0
		world_b.collision_enabled = active == 1
