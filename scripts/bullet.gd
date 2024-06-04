extends RigidBody2D


func _on_distroy_timer_timeout():
	queue_free()

