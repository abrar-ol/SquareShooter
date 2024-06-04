extends CharacterBody2D

@export var speed = 400
var bullet_speed = 1000
var bullet = preload("res://scenes/bullet.tscn")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	look_at(get_global_mouse_position())

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		fire()
	get_input()
	move_and_slide()

func fire():
	var bullet_instance =  bullet.instantiate()
	bullet_instance.set_meta("tag","Bullet")
	bullet_instance.position = $BulletPoint.get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",bullet_instance)

func kill():
	get_tree().reload_current_scene()

func _on_area_2d_body_entered(body):
	if body.has_meta("tag") and body.get_meta("tag") == "Enemy" :
		kill()
