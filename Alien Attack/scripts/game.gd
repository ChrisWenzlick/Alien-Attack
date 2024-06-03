extends Node2D


@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var enemy_hit_sound = $EnemyHitSound
@onready var explode_sound = $ExplodeSound

@export var player_hp = 5

const GAME_OVER_SCREEN = preload("res://scenes/game_over_screen.tscn")

var score = 0


func _ready():
	hud.set_score(0)
	hud.set_hp(player_hp)


func _on_player_took_damage():
	explode_sound.play()
	player_hp -= 1
	hud.set_hp(player_hp)
	if player_hp <= 0:
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var game_over = GAME_OVER_SCREEN.instantiate()
		game_over.set_score(score)
		ui.add_child(game_over)


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("enemy_died", _on_enemy_died)
	add_child(enemy_instance)


func _on_enemy_died():
	enemy_hit_sound.play()
	score += 100
	hud.set_score(score)


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("enemy_died", _on_enemy_died)
