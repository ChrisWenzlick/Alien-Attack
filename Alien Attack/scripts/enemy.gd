extends Area2D


@export var move_speed = 200


func _physics_process(delta):
	global_position.x += -move_speed * delta


func die():
	queue_free()


func _on_visibility_notifier_screen_exited():
	queue_free()
