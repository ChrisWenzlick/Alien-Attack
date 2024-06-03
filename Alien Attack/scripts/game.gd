extends Node2D


@onready var player = $Player
@onready var hud = $UI/HUD

@export var player_hp = 5

var score = 0


func _ready():
	hud.set_score(0)
	hud.set_hp(player_hp)


func _on_player_took_damage():
	player_hp -= 1
	hud.set_hp(player_hp)
	if player_hp <= 0:
		player.die()
	


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("enemy_died", _on_enemy_died)
	add_child(enemy_instance)


func _on_enemy_died():
	score += 100
	hud.set_score(score)
