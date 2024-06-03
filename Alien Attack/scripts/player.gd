extends CharacterBody2D


signal took_damage()


@onready var rocket_container = $RocketContainer
@onready var shoot_sound = $ShootSound

@export var move_speed = 30000.0
@export var rocket_scene: PackedScene


func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()


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


func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position + Vector2(60, 0)
	shoot_sound.play()


func take_damage():
	emit_signal("took_damage")


func die():
	queue_free()
