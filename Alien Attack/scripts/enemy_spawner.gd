extends Node2D


signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)


@export var enemy_scene: PackedScene
@export var path_enemy_scene: PackedScene

var spawn_positions: Array


func _ready():
	spawn_positions = get_node("SpawnPositions").get_children()


func spawn():
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = spawn_positions.pick_random().global_position
	emit_signal("enemy_spawned", enemy_instance)


func _on_timer_timeout():
	spawn()


func _on_path_enemy_timer_timeout():
	spawn_path_enemy()


func spawn_path_enemy():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
