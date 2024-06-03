extends Area2D


signal enemy_died


@export var move_speed = 200


func _physics_process(delta):
	global_position.x += -move_speed * delta


func die():
	emit_signal("enemy_died")
	queue_free()


func _on_visibility_notifier_screen_exited():
	queue_free()


func _on_body_entered(body):
	body.take_damage()
	queue_free()
