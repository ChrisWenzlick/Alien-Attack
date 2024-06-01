extends Area2D

@export var move_speed = 1000

func _physics_process(delta):
	global_position.x += move_speed * delta


func _on_visible_notifier_screen_exited():
	queue_free()