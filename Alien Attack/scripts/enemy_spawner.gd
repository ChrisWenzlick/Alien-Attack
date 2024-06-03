extends Node2D


signal enemy_spawned(enemy_instance)


@export var enemy_scene: PackedScene

var spawn_positions: Array


func _ready():
	spawn_positions = get_node("SpawnPositions").get_children()


func spawn():
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = spawn_positions.pick_random().global_position
	emit_signal("enemy_spawned", enemy_instance)


func _on_timer_timeout():
	spawn()
