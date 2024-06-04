extends CharacterBody2D


var enemy_speed = 50
var motion = Vector2()

func _ready():
	set_meta("tag","Enemy")

func _physics_process(delta):
	var Player = get_node("../../Player")
	position += (Player.position - position) / enemy_speed
	look_at(Player.position)
	move_and_collide(motion)



func _on_hitbox_body_entered(body):
	if  body.has_meta("tag") and body.get_meta("tag") == "Bullet" :
		queue_free()
