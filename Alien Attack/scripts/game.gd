extends Node2D


@onready var player = $Player

@export var player_hp = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_took_damage():
	player_hp -= 1
	if player_hp <= 0:
		player.die()
	
