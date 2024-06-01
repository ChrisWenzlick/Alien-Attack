extends CharacterBody2D


@export var move_speed = 30000.0


func _physics_process(delta):
	var move_direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		move_direction.x = 1.0
	if Input.is_action_pressed("move_left"):
		move_direction.x = -1.0
	if Input.is_action_pressed("move_down"):
		move_direction.y = 1.0
	if Input.is_action_pressed("move_up"):
		move_direction.y = -1.0
	
	velocity = move_direction.normalized() * move_speed * delta
	move_and_slide()
	
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
	print(global_position)
